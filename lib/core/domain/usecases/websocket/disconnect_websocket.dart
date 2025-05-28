import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:studia/core/error/failures.dart';
import 'package:studia/core/domain/repositories/websocket_repository.dart';

@lazySingleton
class DisconnectWebSocket {
  final WebSocketRepository repository;

  DisconnectWebSocket(this.repository);

  Future<Either<Failure, void>> call() async {
    return await repository.disconnect();
  }
}
