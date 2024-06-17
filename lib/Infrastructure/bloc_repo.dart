import 'package:basics/Domain/account_manager/bloc.dart';

import 'package:basics/Domain/paged_list.dart';

import 'package:basics/Infrastructure/basic_repo.dart';
import 'package:basics/Infrastructure/dio_client.dart';
import 'package:basics/Infrastructure/urls.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:basics/DI.dart';

@lazySingleton
class BlockManagerRepo extends BasicRepo {
  final dioClient = getIt.get<DioClient>();

  BlockManagerRepo() : super();

  Future<Either<String, PagedList<Block>>> getAllBlocks(
      int page, int pageSize, String? sortColumn, String? sortOrder) async {
    try {
      final response = await dioClient.dio.get(blockUrl,
          queryParameters: {'page': page, 'pageSize': pageSize},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      final PagedList<Block> pagedList =
          PagedList.fromJson(response.data, Block.fromJson);

      if (response.statusCode != 200) {
        return Left(response.statusMessage!);
      }

      return Right(pagedList);
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }

  Future<Either<String, Block>> getBlockInfo(
      String BlockId, String accessToken) async {
    try {
      final response = await dioClient.dio.get('$blockUrl$BlockId',
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      Block BlockInfo = Block.fromJson(response.data);
      return Right(BlockInfo);
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }

  Future<Either<String, Block>> updateBlockInfo() async {
    try {
      final response = await dioClient.dio.patch(blockUrl,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }

  Future<Either<String, Block>> deleteBlockInfo(String BlockId) async {
    try {
      final response = await dioClient.dio.patch(blockUrl,
          queryParameters: {"id": BlockId},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }

  Future<Either<String, Block>> createBlock(String BlockId) async {
    try {
      final response = await dioClient.dio.patch(blockUrl,
          queryParameters: {"id": BlockId},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }
}
