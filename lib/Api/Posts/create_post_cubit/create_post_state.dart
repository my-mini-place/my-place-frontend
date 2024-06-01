part of 'create_post_cubit.dart';

abstract class CreatePostState {}

class CreatePostInitial extends CreatePostState {}

class CreatePostLoading extends CreatePostState {}

class CreatePostError extends CreatePostState {
  String errorMessage;

  CreatePostError(this.errorMessage);
}

class CreatePostSucces extends CreatePostState {}
