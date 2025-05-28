import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'dart:io';

class DioService {
  late Dio _dio;

  Dio get dio => _dio;

  DioService();

  Future<void> setupDio() async {
    final dio = Dio();
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    var cookieJar = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage("$appDocPath/.cookies/"),
    );
    dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
    _dio = dio;
  }
}

@module
abstract class DioModule {
  @preResolve
  @lazySingleton
  Future<DioService> get dioService async {
    final dioService = DioService();
    await dioService.setupDio();
    return dioService;
  }
}
