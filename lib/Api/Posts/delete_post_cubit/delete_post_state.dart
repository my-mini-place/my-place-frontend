part of 'delete_post_cubit.dart';

abstract class DeletePostState {}

class DeletePostInitial extends DeletePostState {}

class DeletePostLoading extends DeletePostState {}

class DeletePostError extends DeletePostState {
  String errorMessage;

  DeletePostError(this.errorMessage);
}

class DeletePostSucces extends DeletePostState {}
