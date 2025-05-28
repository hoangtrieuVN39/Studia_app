import 'package:dartz/dartz.dart';
import 'package:studia/features/chat/data/models/message_model.dart';
import 'package:studia/features/chat/domain/entities/message.dart';
import 'package:studia/features/chat/domain/repositories/message_repository.dart';

// Basic Failure class for now
abstract class Failure {}

class ServerFailure extends Failure {
  final String message;
  ServerFailure({required this.message});
}

class SendMessage {
  final MessageRepository repository;

  SendMessage(this.repository);

  Future<Either<Failure, void>> call(MessageModel message) async {
    try {
      await repository.sendMessage(message);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
