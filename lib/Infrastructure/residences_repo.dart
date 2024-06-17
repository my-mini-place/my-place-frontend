import 'package:basics/Domain/account_manager/residence.dart';

import 'package:basics/Domain/paged_list.dart';

import 'package:basics/Infrastructure/basic_repo.dart';
import 'package:basics/Infrastructure/dio_client.dart';
import 'package:basics/Infrastructure/urls.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:basics/DI.dart';
import 'package:basics/Domain/account_manager/usereditInfo.dart';

@lazySingleton
class ResidenceManagerRepo extends BasicRepo {
  final dioClient = getIt.get<DioClient>();

  ResidenceManagerRepo() : super();

  Future<Either<String, PagedList<Residence>>> getAllResidences(
      int page, int pageSize, String? sortColumn, String? sortOrder) async {
    try {
      final response = await dioClient.dio.get(getResidencesUrl,
          queryParameters: {'page': page, 'pageSize': pageSize},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      final PagedList<Residence> pagedList =
          PagedList.fromJson(response.data, Residence.fromJson);

      if (response.statusCode != 200) {
        return Left(response.statusMessage!);
      }

      return Right(pagedList);
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }

  Future<Either<String, Residence>> getResidenceInfo(
      String ResidenceId, String accessToken) async {
    try {
      final response = await dioClient.dio.get('$residenceUrl$ResidenceId',
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      Residence ResidenceInfo = Residence.fromJson(response.data);
      return Right(ResidenceInfo);
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }

  Future<Either<String, Residence>> updateResidenceInfo() async {
    try {
      final response = await dioClient.dio.patch(residenceUrl,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }

  Future<Either<String, Residence>> deleteResidenceInfo(
      String residenceId) async {
    try {
      final response = await dioClient.dio.patch(residenceUrl,
          queryParameters: {"id": residenceId},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }

  Future<Either<String, Residence>> createResidence(String residenceId) async {
    try {
      final response = await dioClient.dio.patch(residenceUrl,
          queryParameters: {"id": residenceId},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }
}
