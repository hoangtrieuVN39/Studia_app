import 'package:dartz/dartz.dart';
import 'package:studia/core/core.dart';
import 'package:studia/features/home/domain/repositories/home_repository.dart';

class FetchRecommendActionsUsecase extends UseCase<void, void> {
  final HomeRepository repository;

  FetchRecommendActionsUsecase({required this.repository});

  @override
  Future<Either<Failure, int>> call(void params) async {
    try {
      final actions = await repository.fetchRecommendActions();
      return Right(actions);
    } catch (e) {
      return Left(FetchRecommendActionsFailure(e.toString()));
    }
  }
}

class FetchRecommendActionsFailure extends Failure {
  FetchRecommendActionsFailure(super.message);
}
