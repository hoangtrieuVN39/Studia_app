import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:studia/core/error/failures.dart';
import 'package:studia/core/domain/repositories/websocket_repository.dart';

@lazySingleton
class GetWebSocketStream {
  final WebSocketRepository repository;

  GetWebSocketStream(this.repository);

  Stream<Either<Failure, String>> call() {
    return repository.messageStream;
  }
}
