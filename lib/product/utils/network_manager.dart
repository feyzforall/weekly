import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weekly/product/constants/endpoints.dart';
import 'package:weekly/product/utils/server_exception.dart';

class NetworkManager {
  final Dio dio;
  static const String apiKey = 'I41eTA2iWodQue383BY7W4ncZnM1GWoI';

  NetworkManager(this.dio) {
    _initializeDio();
  }

  void _initializeDio() {
    dio
      // ..interceptors.add(LogInterceptor(responseBody: true))
      ..options.baseUrl = Endpoints.baseUrl;
  }

  Future<dynamic> get(String url) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: {
          'api-key': apiKey,
        },
      );
      final String res = jsonEncode(response.data);

      // if (kDebugMode) {
      //   print('[Network Manager - GET] Server Response: $res');
      // }

      return response.data;
    } on DioException catch (err) {
      throw ServerException(
        statusCode: err.response?.statusCode,
        message: err.message,
      );
    }
  }
}
