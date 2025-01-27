import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_weather_app/core/utils/constants.dart';


class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.options.baseUrl = Constants.baseUrl;
    _dio.options.headers = {
      'Content-Type': 'application/json',
    };
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});

