import 'package:dartz/dartz.dart';
import 'package:studia/core/core.dart';
import 'package:studia/features/home/domain/repositories/home_repository.dart';

class FetchValidActionsUsecase extends UseCase<void, void> {
  final HomeRepository repository;

  FetchValidActionsUsecase({required this.repository});

  @override
  Future<Either<Failure, List<int>>> call(void params) async {
    try {
      final actions = await repository.fetchValidActions();
      return Right(actions);
    } catch (e) {
      return Left(FetchValidActionsFailure(e.toString()));
    }
  }
}

class FetchValidActionsFailure extends Failure {
  FetchValidActionsFailure(super.message);
}
