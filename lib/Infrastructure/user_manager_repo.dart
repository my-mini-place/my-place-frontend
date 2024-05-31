import 'package:basics/Domain/account_manager/User.dart';
import 'package:basics/Domain/account_manager/userdetails.dart';
import 'package:basics/Infrastructure/dio_client.dart';
import 'package:basics/Infrastructure/urls.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:basics/DI.dart';

@lazySingleton
class UserManagerRepo {
  final dioClient = getIt.get<DioClient>();

  UserManagerRepo();

  Future<Either<String, List<User>>> getAllUsers() async {
    try {
      // idk czy on automatycznie bedzie probowla zamieniac json na list<User>
      final response =
          await dioClient.dio.get<List<User>>('https://example.com/api/users');
      List<User> users = response.data!;

      return Right(users);
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }

  Future<Either<String, UserFullInfo>> getUserInfo(
      String userId, String accessToken) async {
    try {
      final response = await dioClient.dio.get('$userInfoUrl$userId',
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      UserFullInfo userInfo = UserFullInfo.fromJson(response.data);
      return Right(userInfo);
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }
}
