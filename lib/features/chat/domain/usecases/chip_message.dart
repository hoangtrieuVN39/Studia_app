import 'package:dartz/dartz.dart';
import 'package:studia/core/usecases/usecase.dart';
import 'package:studia/features/chat/domain/usecases/get_messages_usecase.dart';

class ChipMessageParams {
  final String currentMessage;
  final String chip;

  ChipMessageParams({required this.currentMessage, required this.chip});
}

class ChipMessage {
  ChipMessage();
  Future<Either<Failure, String>> call(ChipMessageParams params) async {
    try {
      String newMessage = params.currentMessage;
      if (newMessage.isNotEmpty) {
        newMessage += " " + params.chip;
      } else {
        newMessage = params.chip;
      }
      return Right(newMessage);
    } catch (e) {
      return Left(
        ServerFailure(message: "Error processing chip: ${e.toString()}"),
      );
    }
  }
}
