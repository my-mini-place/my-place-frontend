import 'dart:ffi';

import 'package:basics/DI.dart';
import 'package:basics/Domain/account_manager/User.dart';
import 'package:basics/Domain/account_manager/userdetails.dart';
import 'package:basics/Domain/posts/post.dart';
import 'package:basics/Domain/posts/postcreate.dart';
import 'package:basics/Infrastructure/dio_client.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PostsRepo {
  final dioClient = getIt.get<DioClient>();

  PostsRepo();

  Future<Either<String, List<Post>>> getAllPosts() async {
    try {
      final response =
          await dioClient.dio.get<List<Post>>('https://example.com/api/users');

      if (response.statusCode != 200 || response.statusCode != 201) {
        return Left(response.statusMessage!);
      }

      return Right(response.data!);
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }

  Future<Either<String, String>> createPost(PostCreate postCreate) async {
    try {
      final response = await dioClient.dio.get('https://example.com/api/users');

      if (response.statusCode != 200 || response.statusCode != 201) {
        return Left(response.statusMessage!);
      }

      return const Right("OK");
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }

  Future<Either<String, String>> deletePost(String postId) async {
    try {
      final response =
          await dioClient.dio.get<List<Post>>('https://example.com/api/users');

      if (response.statusCode != 200 || response.statusCode != 201) {
        return Left(response.statusMessage!);
      }

      return const Right("UDALO SIE ");
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }

  Future<Either<String, String>> postVote() async {
    try {
      final response =
          await dioClient.dio.get<List<Post>>('https://example.com/api/users');

      if (response.statusCode != 200 || response.statusCode != 201) {
        return Left(response.statusMessage!);
      }

      return const Right("UDALO SIE !");
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }
}
