part of 'edit_post_cubit.dart';

abstract class EditPostState {}

class EditPostInitial extends EditPostState {}

class EditPostLoading extends EditPostState {}

class EditPostError extends EditPostState {
  String errorMessage;

  EditPostError(this.errorMessage);
}

class EditPostSucces extends EditPostState {}
