import 'package:studia/core/network/network_info.dart';

class CheckInternetConnectionUsecase {
  final NetworkInfo networkInfo;

  CheckInternetConnectionUsecase({required this.networkInfo});

  Future<bool> call() async {
    return await networkInfo.isConnected;
  }
}
