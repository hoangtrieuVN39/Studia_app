import 'package:dartz/dartz.dart';
import 'package:studia/core/error/failures.dart';

abstract class WebSocketRepository {
  Future<Either<Failure, void>> connect(String url);
  Future<Either<Failure, void>> disconnect();
  Future<Either<Failure, void>> sendMessage(String message);
  Stream<Either<Failure, String>> get messageStream;
}
