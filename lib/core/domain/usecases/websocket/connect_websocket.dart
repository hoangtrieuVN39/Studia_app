import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:studia/core/error/failures.dart';
import 'package:studia/core/domain/repositories/websocket_repository.dart';

@lazySingleton
class ConnectWebSocket {
  final WebSocketRepository repository;

  ConnectWebSocket(this.repository);

  Future<Either<Failure, void>> call(String url) async {
    return await repository.connect(url);
  }
}
