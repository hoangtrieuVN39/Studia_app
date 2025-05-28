import 'dart:async';
import 'dart:convert';

import 'package:studia/core/data/datasources/remote/websocket.dart';
import 'package:studia/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:studia/core/core.dart';

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  WebSocketManager? _manager;
  StreamController<Map<String, dynamic>>? _messageStreamController;
  final String _websocketBaseUrl;

  ChatRemoteDataSourceImpl({required String userId})
    : _websocketBaseUrl =
          '${ApiConstants.baseUrl}/${ApiConstants.websocket}$userId';

  @override
  Future<void> connect() async {
    if (_manager != null) {
      print("WebSocket already connected.");
      return;
    }

    final url = '$_websocketBaseUrl';
    print("Connecting to WebSocket: $url");

    try {
      _manager = WebSocketManager(rawUrl: url);
      _messageStreamController =
          StreamController<Map<String, dynamic>>.broadcast();

      _manager!.onMessage((data) {
        try {
          final decodedData = jsonDecode(data) as Map<String, dynamic>;
          _messageStreamController?.add(decodedData);
        } catch (e) {
          print("Error decoding WebSocket message: $e. Data: $data");
        }
      });

      print("WebSocket connected successfully.");
    } catch (e) {
      print("Error connecting to WebSocket: $e");
      _messageStreamController?.addError(
        Exception("Failed to connect to WebSocket: $e"),
      );
      await disconnect(); // Clean up on error
      rethrow; // Propagate connection error
    }
  }

  @override
  Stream<List<Map<String, dynamic>>> getMessageStream() {
    if (_messageStreamController == null ||
        _messageStreamController!.isClosed) {
      print(
        "Message stream requested but not active. Attempting to connect...",
      );
      connect();
    }

    if (_messageStreamController == null ||
        _messageStreamController!.isClosed) {
      return Stream.error(
        Exception(
          "WebSocket not connected or stream controller closed. Call connect() first.",
        ),
      );
    }
    return _messageStreamController!.stream.map((data) => [data]);
  }

  @override
  Future<void> sendMessage(String messageJson) async {
    if (_manager == null) {
      print("Cannot send message: WebSocket not connected.");
      throw Exception('WebSocket not connected. Call connect() first.');
    }

    try {
      _manager!.sendMessage(messageJson);
      print("Message sent: $messageJson");
    } catch (e) {
      print("Error sending message via WebSocket: $e");
      rethrow;
    }
  }

  @override
  Future<void> disconnect() async {
    if (_manager != null) {
      print("Disconnecting WebSocket...");
      _manager!.close();
      _manager = null;
    }

    if (_messageStreamController != null &&
        !_messageStreamController!.isClosed) {
      await _messageStreamController!.close();
    }
    _messageStreamController = null;
    print("WebSocket disconnected.");
  }
}
