import 'dart:async';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class DioClient {
  late final Dio _dio = Dio();

  DioClient() {
    _dio.options = BaseOptions(
      baseUrl: "localtwojastara",
      receiveTimeout: const Duration(seconds: 10000),
      connectTimeout: const Duration(seconds: 10000),
      sendTimeout: const Duration(seconds: 10000),
    );
  }

  Dio get dio => _dio;
}
