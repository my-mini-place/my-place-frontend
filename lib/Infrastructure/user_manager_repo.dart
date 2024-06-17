import 'package:basics/Domain/account_manager/User.dart';
import 'package:basics/Domain/account_manager/userdetails.dart';
import 'package:basics/Domain/paged_list.dart';
import 'package:basics/Domain/posts/post.dart';
import 'package:basics/Infrastructure/basic_repo.dart';
import 'package:basics/Infrastructure/dio_client.dart';
import 'package:basics/Infrastructure/urls.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:basics/DI.dart';
import 'package:basics/Domain/account_manager/usereditInfo.dart';

@lazySingleton
class UserManagerRepo extends BasicRepo {
  final dioClient = getIt.get<DioClient>();

  UserManagerRepo() : super();

  Future<Either<String, PagedList<User>>> getAllUsers(
      int page, int pageSize, String? sortColumn, String? sortOrder) async {
    try {
      final response = await dioClient.dio.get(getUsersUrl,
          queryParameters: {'page': page, 'pageSize': pageSize},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      final PagedList<User> pagedList =
          PagedList.fromJson(response.data, User.fromJson);

      if (response.statusCode != 200) {
        return Left(response.statusMessage!);
      }

      return Right(pagedList);

      // List<User> users = response.data!;
      // var json = {
      //   "items": [
      //     {
      //       "id": "6ae40b13-20a8-462c-9364-a455ef2d3908",
      //       "email": "user1@example.com",
      //       "name": "John",
      //       "surname": "Doe",
      //       "createdAt": "2021-06-15T14:48:00.000Z",
      //       "role": "Administrator"
      //     },
      //     {
      //       "id": "2",
      //       "email": "user2@example.com",
      //       "name": "Jane",
      //       "surname": "Smith",
      //       "createdAt": "2021-06-16T15:00:00.000Z",
      //       "role": "User"
      //     },
      //     {
      //       "id": "3",
      //       "email": "user3@example.com",
      //       "name": "Alice",
      //       "surname": "Johnson",
      //       "createdAt": "2021-06-17T16:20:00.000Z",
      //       "role": "Moderator"
      //     }
      //   ],
      //   "totalCount": 3,
      //   "pageIndex": 1,
      //   "pageSize": 10
      // };
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

  Future<Either<String, UserFullInfo>> editUserInfo(
      String? email, String? name, String? surname, String? phoneNumber) async {
    try {
      var editUserInfo = UserEditInfo(
          id: userId,
          email: email,
          name: name,
          phoneNumber: phoneNumber,
          surname: surname);

      var datajson = editUserInfo.toJson();
      final response = await dioClient.dio.patch(EditUserInfoUrl,
          data: datajson,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      UserFullInfo userInfo = UserFullInfo.fromJson(response.data);
      return Right(userInfo);
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }
}
