import 'package:basics/DI.dart';

import 'package:basics/Domain/auth_entities/auth_exception.dart';
import 'package:basics/Domain/auth_entities/token.dart';

import 'package:basics/Infrastructure/dio_client.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../Domain/Interfaces/auth_interface.dart';

@LazySingleton(as: AuthInterface)
class AuthService implements AuthInterface {
  AuthService();

  final dioClient = getIt.get<DioClient>();

  @override
  Future<Either<AuthException, Token>> register(
      String email, String pass, String confirmPass) async {
    try {
      final result = await dioClient.dio.post<Map<String, dynamic>>(
          "twpkastaara",
          data: {'email': email, 'pass': pass, 'confirmPass': confirmPass});
      if (result.data != null) {
        return Right(Token.fromJson(result.data!));
      } else {
        return const Left(AuthException.wrongEmailOrPass());
      }
    } on DioException {
      return const Left(AuthException.serverError());
    }
  }

  @override
  Future<Either<AuthException, Token>> login(String email, String pass) async {
    try {
      final result = await dioClient.dio.post<Map<String, dynamic>>(
          "https://localhost:54487/api/Security/login",
          data: {
            'email': "Admin123@gmail.com",
            'password': "Admin123",
          });
      if (result.data != null) {
        return Right(Token.fromJson(result.data!));
      } else {
        return const Left(AuthException.wrongEmailOrPass());
      }
    } on DioException {
      return const Left(AuthException.serverError());
    }
  }

  @override
  Future<Either<AuthException, Unit>> logout(String idToken) {
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthException, Token>> refreshToken(String refreshToken) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }
}

// @override
// Future<Either<AuthException, Unit>> logout(String idToken) async {
//   // try {
//   //   final result =
//   //       await dioClient.dio.post("twojastara", data: {'idToken': idToken});
//   //   return right(unit);
//   // } on DioException catch (e) {
//   //   return const Left(AuthException.serverError());
//   // }
// }

// @override
// Future<Either<AuthException, Token>> refreshToken(String refreshToken) async {
//   try {
//     final Response result = await dioClient.dio
//         .post("twojastara", data: {'refreshToken': refreshToken});
//     return Right(result.data);
//   } on DioException catch (e) {
//     return const Left(AuthException.serverError());
//   }
// }
