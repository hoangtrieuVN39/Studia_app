import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:studia/core/network/network_info.dart';
import 'package:studia/features/auth/domain/usecases/check_internet_connection_usecase.dart';

@GenerateNiceMocks([MockSpec<NetworkInfo>()])
import 'check_internet_connection_usecase_test.mocks.dart';

void main() {
  late CheckInternetConnectionUsecase usecase;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    usecase = CheckInternetConnectionUsecase(networkInfo: mockNetworkInfo);
  });

  test('should check internet connection from NetworkInfo', () async {
    // arrange
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

    // act
    final result = await usecase();

    // assert
    verify(mockNetworkInfo.isConnected);
    expect(result, true);
  });
}
