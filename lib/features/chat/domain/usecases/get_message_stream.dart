import 'package:dartz/dartz.dart';
import 'package:studia/core/usecases/usecase.dart';
import 'package:studia/features/chat/domain/entities/message.dart';
import 'package:studia/features/chat/domain/repositories/message_repository.dart';
import 'send_message.dart'; // Importing to use the Failure class

class GetMessageStream {
  final MessageRepository repository;
  final String userId;

  GetMessageStream(this.repository, this.userId);

  Future<Either<Failure, Stream<List<Message>>>> call() async {
    try {
      final stream = repository.getMessageStream();
      return Right(stream);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
