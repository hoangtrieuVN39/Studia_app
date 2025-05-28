import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:studia/core/error/failures.dart';
import 'package:studia/core/domain/repositories/websocket_repository.dart';

@lazySingleton
class SendWebSocketMessage {
  final WebSocketRepository repository;

  SendWebSocketMessage(this.repository);

  Future<Either<Failure, void>> call(String message) async {
    return await repository.sendMessage(message);
  }
} 