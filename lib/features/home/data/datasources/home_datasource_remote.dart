import 'dart:math';

import 'package:dio/dio.dart';

class HomeRemoteDataSource {
  final Dio dio;

  HomeRemoteDataSource({required this.dio});

  Future<Map<String, dynamic>> fetchPerformance({
    required String userId,
  }) async {
    // final response = await dio.get(
    //   'https://api.studia.com/performance/$userId',
    // );
    // return response.data;

    return {
      for (var i = 0; i < 300; i++)
        '$i': {
          'performance': Random().nextDouble(),
          'prerequisite':
              Random().nextInt(300) - 150 < 0 ? 0 : Random().nextInt(300) - 150,
        },
    };
  }
}
