import 'dart:async';

import 'package:basics/DI.dart';

import 'package:basics/Domain/posts/post.dart';
import 'package:basics/Domain/posts/postcreate.dart';
import 'package:basics/Domain/posts/postedit.dart';
import 'package:basics/Domain/posts/vote.dart';
import 'package:basics/Infrastructure/basic_repo.dart';
import 'package:basics/Infrastructure/dio_client.dart';
import 'package:basics/Domain/paged_list.dart';
import 'package:basics/Infrastructure/urls.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';

@lazySingleton
class PostsRepo extends BasicRepo {
  final dioClient = getIt.get<DioClient>();

  PostsRepo() : super();

  Future<Either<String, PagedList<Post>>> getAllPosts(
      int page, int pageSize) async {
    try {
      final response = await dioClient.dio.get(getPostsUrl,
          queryParameters: {'page': page, 'pageSize': pageSize},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      final PagedList<Post> pagedList =
          PagedList.fromJson(response.data, Post.fromJson);

      if (response.statusCode != 200) {
        return Left(response.statusMessage!);
      }

      return Right(pagedList);
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }

  Future<Either<String, String>> createPost(PostCreate postCreate) async {
    try {
      Map<String, dynamic> datajson = postCreate.toJson();

      final response = await dioClient.dio.post(createPostsUrl,
          data: datajson,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      if (response.statusCode != 200) {
        return Left(response.statusMessage!);
      }

      return const Right("OK");
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }

  Future<Either<String, String>> editPost(PostEdit editPost) async {
    try {
      Map<String, dynamic> datajson = editPost.toJson();

      final response = await dioClient.dio.patch(editPostsUrl,
          data: datajson,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      if (response.statusCode != 200) {
        return Left(response.statusMessage!);
      }

      return const Right("OK");
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }

  Future<Either<String, String>> deletePost(String postId) async {
    try {
      if (!isAuthenticated) {
        return const Left("Not Authenticated");
      }

      final response = await dioClient.dio.delete("$deletePostUrl/$postId",
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      if (response.statusCode != 200) {
        return Left(response.statusMessage!);
      }

      return const Right("OK");
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }

  Future<Either<String, String>> postVote(
      String postId, String optionId) async {
    Vote vote = Vote(optionId, userId, postId);

    try {
      final response = await dioClient.dio.post(votePostUrl,
          data: vote.toJson(),
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      if (response.statusCode != 200) {
        return Left(response.statusMessage!);
      }

      return const Right("UDALO SIE !");
    } on DioException catch (e) {
      return Left(e.message!);
    }
  }
}
