import 'dart:async';
import 'package:web_socket_channel/web_socket_channel.dart';

enum WebSocketState { connecting, connected, disconnected, error }

class WebSocketManager {
  final String finalUrl;
  WebSocketChannel? _channel;
  WebSocketState _state = WebSocketState.disconnected;
  Timer? _reconnectTimer;
  StreamController<String>? _messageController;
  final List<void Function(String)> _messageHandlers = [];
  StreamSubscription? _channelSubscription;
  bool _isClosing = false;

  WebSocketState get state => _state;

  WebSocketManager({required String rawUrl})
    : finalUrl = _sanitizeAndNormalizeUrl(rawUrl) {
    connect();
  }

  void _initializeStreamController() {
    if (_isClosing) return;

    if (_messageController?.isClosed ?? true) {
      _messageController = StreamController<String>.broadcast();
      print("WebSocketManager: New StreamController created");
    }
  }

  Future<void> connect() async {
    if (_isClosing) return;

    if (_state == WebSocketState.connecting ||
        _state == WebSocketState.connected) {
      print("WebSocketManager: Already connected or connecting");
      return;
    }

    print("WebSocketManager: Starting connection to $finalUrl");
    _state = WebSocketState.connecting;

    try {
      // Cancel existing subscription if any
      await _channelSubscription?.cancel();
      _channelSubscription = null;

      // Close existing channel if any
      if (_channel != null) {
        await _channel!.sink.close();
        _channel = null;
      }

      _initializeStreamController();
      _channel = WebSocketChannel.connect(Uri.parse(finalUrl));
      _setupListeners();
      _state = WebSocketState.connected;
      print("WebSocketManager: Connected successfully to $finalUrl");
    } catch (e) {
      print("WebSocketManager: Connection failed: $e");
      _state = WebSocketState.error;
      if (!_isClosing) {
        _scheduleReconnect();
      }
    }
  }

  void _setupListeners() {
    if (_isClosing || _channel == null) return;

    _channelSubscription = _channel!.stream.listen(
      (message) {
        if (_isClosing) return;

        final messageStr = message.toString();
        print("WebSocketManager: Received message: $messageStr");

        // Check if controller is available and not closed
        if (_messageController != null && !_messageController!.isClosed) {
          try {
            _messageController!.add(messageStr);
          } catch (e) {
            print("WebSocketManager: Error adding to stream controller: $e");
          }
        }

        // Also notify direct handlers
        for (final handler in _messageHandlers) {
          try {
            handler(messageStr);
          } catch (e) {
            print("WebSocketManager: Error in message handler: $e");
          }
        }
      },
      onError: (error) {
        print("WebSocketManager: Stream error: $error");
        _state = WebSocketState.error;
        if (!_isClosing) {
          _scheduleReconnect();
        }
      },
      onDone: () {
        print("WebSocketManager: Connection closed");
        _state = WebSocketState.disconnected;
        if (!_isClosing) {
          _scheduleReconnect();
        }
      },
      cancelOnError: false,
    );
  }

  void _scheduleReconnect() {
    if (_isClosing) return;

    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(const Duration(seconds: 5), () {
      if (!_isClosing) {
        print("WebSocketManager: Attempting to reconnect...");
        connect();
      }
    });
  }

  static String _sanitizeAndNormalizeUrl(String urlInput) {
    String currentUrl = urlInput;
    if (currentUrl.contains('#')) {
      currentUrl = currentUrl.substring(0, currentUrl.indexOf('#'));
    }

    Uri parsedUri;
    try {
      parsedUri = Uri.parse(currentUrl);
      if (parsedUri.scheme != 'ws' && parsedUri.scheme != 'wss') {
        parsedUri = parsedUri.replace(scheme: 'ws');
      }
    } catch (e) {
      if (!currentUrl.startsWith('ws://') && !currentUrl.startsWith('wss://')) {
        currentUrl = 'ws://$currentUrl';
      }
      try {
        parsedUri = Uri.parse(currentUrl);
        if (parsedUri.scheme != 'ws' && parsedUri.scheme != 'wss') {
          parsedUri = parsedUri.replace(scheme: 'ws');
        }
      } catch (e2) {
        print(
          "WebSocketManager: Failed to parse WebSocket URL even after sanitization attempts: $urlInput. Error: $e2",
        );
        rethrow;
      }
    }

    print(
      "WebSocketManager: Sanitized URL: ${parsedUri.toString()} from input: $urlInput",
    );
    return parsedUri.toString();
  }

  void sendMessage(String message) {
    if (_isClosing) {
      print("WebSocketManager: Cannot send message - manager is closing");
      return;
    }

    if (_state != WebSocketState.connected) {
      print(
        "WebSocketManager: Cannot send message - not connected (state: $_state)",
      );
      return;
    }

    if (_channel == null) {
      print("WebSocketManager: Cannot send message - no channel");
      return;
    }

    try {
      _channel!.sink.add(message);
      print("WebSocketManager: Message sent successfully");
    } catch (e) {
      print("WebSocketManager: Error sending message: $e");
    }
  }

  Stream<String> get messageStream {
    if (_isClosing) {
      return Stream.empty();
    }

    _initializeStreamController();
    return _messageController!.stream;
  }

  void onMessage(void Function(String) onMessage) {
    if (!_isClosing) {
      _messageHandlers.add(onMessage);
    }
  }

  Future<void> close() async {
    print("WebSocketManager: Starting close process");
    _isClosing = true;

    // Cancel reconnection timer
    _reconnectTimer?.cancel();
    _reconnectTimer = null;

    // Cancel channel subscription
    await _channelSubscription?.cancel();
    _channelSubscription = null;

    // Close channel
    if (_channel != null) {
      try {
        await _channel!.sink.close();
      } catch (e) {
        print("WebSocketManager: Error closing channel: $e");
      }
      _channel = null;
    }

    // Close message controller
    if (_messageController != null && !_messageController!.isClosed) {
      try {
        await _messageController!.close();
      } catch (e) {
        print("WebSocketManager: Error closing message controller: $e");
      }
    }
    _messageController = null;

    // Clear handlers
    _messageHandlers.clear();

    _state = WebSocketState.disconnected;
    print("WebSocketManager: Close process completed");
  }
}
