import 'package:basics/Domain/auth_entities/auth_exception.dart';
import 'package:basics/Domain/auth_entities/register.dart';
import 'package:basics/Domain/auth_entities/reset_password.dart';
import 'package:basics/Domain/auth_entities/token.dart';

import 'package:dartz/dartz.dart';


abstract class AuthInterface {
  Future<Either<AuthException, String>> register(Register registerdata);
  Future<Either<AuthException, Token>> login(String email, String pass);
  Future<Either<AuthException, Unit>> logout(String idToken);
  Future<Either<AuthException, Token>> refreshToken(String refreshToken);

  Future<Either<AuthException, void>> resetPassword(ResetPassword resetPass);
  Future<Either<AuthException, void>> forgotPassword(String email);
}
