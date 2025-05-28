import 'package:dartz/dartz.dart';
import 'package:studia/core/usecases/usecase.dart';
import 'package:studia/features/chat/domain/entities/message.dart';
import 'package:studia/features/chat/domain/repositories/message_repository.dart';

class GetMessagesUsecase {
  final MessageRepository repository;
  final String userId;

  GetMessagesUsecase(this.repository, this.userId);

  Future<Either<Failure, List<Message>>> call() async {
    try {
      final stream = await repository.getMessages(userId);
      return Right(stream);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

// Basic Failure class for now
abstract class Failure {}

class ServerFailure extends Failure {
  final String message;
  ServerFailure({required this.message});
}
