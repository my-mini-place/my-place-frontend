part of 'get_posts_cubit.dart';

abstract class GetPostsState {}

class InitialGetPosts extends GetPostsState {}

class LoadingGetPosts extends GetPostsState {}

class ErrorGetPosts extends GetPostsState {}

class LoadedGetPosts extends GetPostsState {}
