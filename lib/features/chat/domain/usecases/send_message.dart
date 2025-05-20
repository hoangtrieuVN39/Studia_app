import 'package:dartz/dartz.dart';
import 'package:studia/features/chat/domain/repositories/message_repository.dart';

// Basic Failure class for now
abstract class Failure {}

class ServerFailure extends Failure {
  final String message;
  ServerFailure({required this.message});
}

class SendMessage{
  final MessageRepository repository;

  SendMessage(this.repository);

  Future<Either<Failure, void>> call(SendMessageParams params) async {
    try {
      await repository.sendMessage(
        params.messageContent,
        params.senderId,
        params.groupId,
      );
      return const Right(null);
    } catch (e) {
      // Assuming a generic ServerFailure for now. You might want to map specific exceptions.
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

class SendMessageParams {
  final String messageContent;
  final String senderId;
  final String groupId; // Assuming a default group or passed via event

  SendMessageParams({
    required this.messageContent,
    required this.senderId,
    this.groupId = 'default_group', // Example default
  });
}
