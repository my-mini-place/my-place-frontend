import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class DioClient {
  late final Dio _dio = Dio();

  DioClient() {
// dio.interceptors.add(
//   InterceptorsWrapper(
//     onRequest: (options, handler) {
//       // Add the access token to the request header
//       options.headers['Authorization'] = 'Bearer your_access_token';
//       return handler.next(options);
//     },

//   ),
// )

    _dio.options = BaseOptions(
      baseUrl: "",
      receiveTimeout: const Duration(seconds: 100000),
      connectTimeout: const Duration(seconds: 100000),
      //   sendTimeout: const Duration(seconds: 100000),
    );
  }

  Dio get dio => _dio;
}
