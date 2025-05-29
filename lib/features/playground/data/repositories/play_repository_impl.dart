import 'package:studia/features/playground/data/datasources/play_datasource_remote.dart';
import 'package:studia/features/playground/domain/entities/answer.dart';
import 'package:studia/features/playground/domain/repositories/play_repository.dart';

class PlayRepositoryImpl extends PlayRepository {
  final PlayDatasourceRemote playDatasourceRemote;

  PlayRepositoryImpl({required this.playDatasourceRemote});

  @override
  Future<List<double>> sendAnswers(List<Answer> answers) async {
    return await playDatasourceRemote.sendAnswers(answers);
  }
}
