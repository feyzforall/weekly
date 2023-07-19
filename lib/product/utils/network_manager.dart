import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weekly/product/constants/endpoints.dart';

class NetworkManager {
  final Dio dio;

  NetworkManager(this.dio) {
    _initializeDio();
  }

  void _initializeDio() {
    dio
      ..interceptors.add(LogInterceptor(responseBody: true))
      ..options.baseUrl = Endpoints.baseUrl;
  }

  Future<dynamic> get(String url) async {
    try {
      final response = await dio.get(url);
      final String res = jsonEncode(response.data);

      if (kDebugMode) {
        print('[Network Manager - GET] Server Response: $res');
      }

      return response.data;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
