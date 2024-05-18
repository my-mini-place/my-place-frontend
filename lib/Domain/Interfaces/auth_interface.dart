import 'package:basics/Domain/auth_entities/auth_exception.dart';
import 'package:basics/Domain/auth_entities/token.dart';

import 'package:dartz/dartz.dart';

abstract class AuthInterface {
  Future<Either<AuthException, Token>> register(
      String email, String pass, String confirmPass);
  Future<Either<AuthException, Token>> login(String email, String pass);
  Future<Either<AuthException, Unit>> logout(String idToken);
  Future<Either<AuthException, Token>> refreshToken(String refreshToken);
}
