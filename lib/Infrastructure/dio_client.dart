import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class DioClient {
  late final Dio _dio = Dio();

  DioClient() {
    _dio.options = BaseOptions(
      baseUrl: "",
      receiveTimeout: const Duration(seconds: 100000),
      connectTimeout: const Duration(seconds: 100000),
      sendTimeout: const Duration(seconds: 100000),
    );
  }

  Dio get dio => _dio;
}
