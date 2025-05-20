import 'dart:async';
import 'dart:convert';

import 'package:studia/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  WebSocketChannel? _channel;
  StreamController<Map<String, dynamic>>? _messageStreamController;
  final String _websocketBaseUrl; // e.g., 'ws://yourserver.com/chat'

  // Constructor can take the base URL for the WebSocket server
  ChatRemoteDataSourceImpl({
    required String websocketBaseUrl,
    required String userId,
  }) : _websocketBaseUrl = websocketBaseUrl + userId;

  @override
  Future<void> connect(String groupId) async {
    if (_channel != null && _channel?.closeCode == null) {
      print("WebSocket already connected.");
      return;
    }

    // Construct the full URL, potentially including the groupId if your backend needs it in the URL
    final url = Uri.parse(
      '$_websocketBaseUrl/$groupId',
    ); // Adjust URL structure as needed
    print("Connecting to WebSocket: $url");

    try {
      _channel = WebSocketChannel.connect(url);
      _messageStreamController =
          StreamController<Map<String, dynamic>>.broadcast();

      _channel!.stream.listen(
        (data) {
          if (data is String) {
            try {
              final decodedData = jsonDecode(data) as Map<String, dynamic>;
              _messageStreamController?.add(decodedData);
            } catch (e) {
              print("Error decoding WebSocket message: $e. Data: $data");
              // Optionally, add raw data or an error object to the stream controller
              // _messageStreamController?.add({'error': 'Failed to parse message', 'rawData': data});
            }
          } else {
            print("Received non-string data from WebSocket: $data");
          }
        },
        onError: (error) {
          print("WebSocket stream error: $error");
          _messageStreamController?.addError(error);
          // Consider attempting to reconnect or cleaning up
          disconnect(); // Clean up on error
        },
        onDone: () {
          print("WebSocket stream done (disconnected).");
          _messageStreamController?.close();
          _channel =
              null; // Ensure channel is marked as null for reconnection logic
        },
      );
      print("WebSocket connected successfully.");
    } catch (e) {
      print("Error connecting to WebSocket: $e");
      _messageStreamController?.addError(
        Exception("Failed to connect to WebSocket: $e"),
      );
      await _messageStreamController
          ?.close(); // Ensure controller is closed on connection failure
      _messageStreamController = null;
      _channel = null;
      rethrow; // Propagate connection error
    }
  }

  @override
  Stream<Map<String, dynamic>> getMessageStream(String groupId) {
    if (_messageStreamController == null ||
        _messageStreamController!.isClosed) {
      print(
        "Message stream requested but not active. Attempting to connect...",
      );
      connect(groupId); // This will create a new stream controller
    }
    // Check again after attempting to connect
    if (_messageStreamController == null ||
        _messageStreamController!.isClosed) {
      return Stream.error(
        Exception(
          "WebSocket not connected or stream controller closed. Call connect() first.",
        ),
      );
    }
    return _messageStreamController!.stream;
  }

  @override
  Future<void> sendMessage(String messageJson) async {
    if (_channel == null || _channel?.closeCode != null) {
      print("Cannot send message: WebSocket not connected.");
      throw Exception('WebSocket not connected. Call connect() first.');
    }
    try {
      _channel!.sink.add(messageJson);
      print("Message sent: $messageJson");
    } catch (e) {
      print("Error sending message via WebSocket: $e");
      rethrow;
    }
  }

  @override
  Future<void> disconnect() async {
    if (_channel != null) {
      print("Disconnecting WebSocket...");
      await _channel!.sink.close();
      // StreamController is closed in onDone of the listener
      // _channel = null; // Handled in onDone
    }
    if (_messageStreamController != null &&
        !_messageStreamController!.isClosed) {
      await _messageStreamController!.close();
    }
    _messageStreamController = null;
    _channel = null; // Explicitly nullify here too for safety
    print("WebSocket disconnected.");
  }
}
