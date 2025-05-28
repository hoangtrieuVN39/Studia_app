import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:studia/core/data/datasources/remote/websocket.dart';
import 'package:studia/core/domain/repositories/websocket_repository.dart';
import 'package:studia/core/error/failures.dart';

@LazySingleton(as: WebSocketRepository)
class WebSocketRepositoryImpl implements WebSocketRepository {
  WebSocketManager? _manager;
  StreamController<Either<Failure, String>>? _messageController;

  void _initializeStreamController() {
    if (_messageController?.isClosed ?? true) {
      _messageController =
          StreamController<Either<Failure, String>>.broadcast();
    }
  }

  @override
  Future<Either<Failure, void>> connect(String url) async {
    try {
      print("WebSocketRepository: Connecting to $url");
      await disconnect(); // Clean up existing connection if any
      _initializeStreamController();

      _manager = WebSocketManager(rawUrl: url);
      _manager!.onMessage((message) {
        print("WebSocketRepository: Received message: $message");
        if (!(_messageController?.isClosed ?? true)) {
          _messageController?.add(Right(message));
        } else {
          print(
            "WebSocketRepository: Warning - StreamController is closed, cannot add message",
          );
        }
      });

      print("WebSocketRepository: Connected successfully");
      return const Right(null);
    } catch (e) {
      print("WebSocketRepository: Connection failed: $e");
      return Left(WebSocketFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> disconnect() async {
    try {
      print("WebSocketRepository: Disconnecting");
      _manager?.close();
      _manager = null;

      if (!(_messageController?.isClosed ?? true)) {
        await _messageController?.close();
      }
      _messageController = null;

      print("WebSocketRepository: Disconnected successfully");
      return const Right(null);
    } catch (e) {
      print("WebSocketRepository: Disconnect failed: $e");
      return Left(WebSocketFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendMessage(String message) async {
    try {
      print("WebSocketRepository: Sending message: $message");
      if (_manager == null) {
        print(
          "WebSocketRepository: Cannot send message - WebSocket not connected",
        );
        return Left(WebSocketFailure('WebSocket not connected'));
      }
      if (_messageController?.isClosed ?? true) {
        print(
          "WebSocketRepository: Cannot send message - StreamController is closed",
        );
        return Left(WebSocketFailure('Connection is closed'));
      }
      _manager!.sendMessage(message);
      print("WebSocketRepository: Message sent successfully");
      return const Right(null);
    } catch (e) {
      print("WebSocketRepository: Failed to send message: $e");
      return Left(WebSocketFailure(e.toString()));
    }
  }

  @override
  Stream<Either<Failure, String>> get messageStream {
    _initializeStreamController();
    return _messageController!.stream;
  }
}
