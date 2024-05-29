import 'package:basics/Domain/account_manager/User.dart';
import 'package:basics/Domain/account_manager/userdetails.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart'; // Biblioteka do obsługi wartości Either

@lazySingleton
class UserManagerRepo {
  final Dio dio;

  UserManagerRepo(this.dio);

  Future<Either<String, List<User>>> getAllUsers() async {
    try {
      final response = await dio.get('https://example.com/api/users');
      List<User> users =
          (response.data as List).map((data) => User.fromJson(data)).toList();
      return Right(users);
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }

  Future<Either<String, UserFullInfo>> getUserInfo(String userId) async {
    try {
      final response = await dio.get('https://example.com/api/users/$userId');
      UserFullInfo userInfo = UserFullInfo.fromJson(response.data);
      return Right(userInfo);
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }
}
