import 'package:basics/DI.dart';

import 'package:basics/Domain/auth_entities/auth_exception.dart';
import 'package:basics/Domain/auth_entities/register.dart';
import 'package:basics/Domain/auth_entities/reset_password.dart';
import 'package:basics/Domain/auth_entities/token.dart';

import 'package:basics/Infrastructure/dio_client.dart';
import 'package:basics/Infrastructure/urls.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../Domain/Interfaces/auth_interface.dart';

@LazySingleton(as: AuthInterface)
class AuthService implements AuthInterface {
  AuthService();

  final dioClient = getIt.get<DioClient>();

  @override
  Future<Either<AuthException, String>> register(Register register) async {
    try {
      final result = await dioClient.dio
          .post<String>(registerUrl, data: register.toJson());

      if (result.statusCode == 200) {
        return const Right("IsGood");
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
      final result =
          await dioClient.dio.post<Map<String, dynamic>>(loginUrl, data: {
        'email': email,
        'password': pass,
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
    throw const Right("OK");
  }

  @override
  Future<Either<AuthException, Token>> refreshToken(String refreshToken) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthException, void>> forgotPassword(String email) async {
    try {
      var result = await dioClient.dio.post(forgotUrl, data: {"Email": email});

      return const Right("VOID");
    } on DioException {
      return const Left(AuthException.serverError());
    }
  }

  @override
  Future<Either<AuthException, void>> resetPassword(
      ResetPassword resetPass) async {
    try {
      // bez freezed
      var result = await dioClient.dio.post(resetUrl, data: resetPass.toJson());

      return const Right("Void fix that later");
    } on DioException {
      return const Left(AuthException.serverError());
    }
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
