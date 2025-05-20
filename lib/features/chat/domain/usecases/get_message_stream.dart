import 'package:dartz/dartz.dart';
import 'package:studia/core/usecases/usecase.dart';
import 'package:studia/features/chat/domain/entities/message.dart';
import 'package:studia/features/chat/domain/repositories/message_repository.dart';
import 'send_message.dart'; // Importing to use the Failure class

class GetMessageStream{
  final MessageRepository repository;

  GetMessageStream(this.repository);

  Future<Either<Failure, Stream<Message>>> call(
    GetMessageStreamParams params,
  ) async {
    try {
      final stream = repository.getMessageStream(params.groupId);
      return Right(stream);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

class GetMessageStreamParams {
  final String groupId;

  GetMessageStreamParams({required this.groupId});
}
