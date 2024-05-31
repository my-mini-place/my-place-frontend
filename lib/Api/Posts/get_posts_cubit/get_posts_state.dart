part of 'get_posts_cubit.dart';

abstract class GetPostsState {}

class InitialGetPosts extends GetPostsState {}

class LoadingGetPosts extends GetPostsState {}

class ErrorGetPosts extends GetPostsState {
  String errorMessage;

  ErrorGetPosts(this.errorMessage);
}

class LoadedGetPosts extends GetPostsState {
  PagedList<Post> posts;

  LoadedGetPosts(this.posts);
}
