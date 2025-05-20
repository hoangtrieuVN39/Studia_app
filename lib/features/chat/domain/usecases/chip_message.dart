import 'package:dartz/dartz.dart';
import 'package:studia/core/usecases/usecase.dart';
import 'package:studia/features/chat/domain/usecases/send_message.dart'; // For Failure class

class ChipMessageParams {
  final String currentMessage;
  final String chip;

  ChipMessageParams({required this.currentMessage, required this.chip});
}

// Assuming ChipMessage is a simple synchronous operation for now, but wrapping in Either for consistency
class ChipMessage {
  ChipMessage(); // Doesn't depend on a repository in this example

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
