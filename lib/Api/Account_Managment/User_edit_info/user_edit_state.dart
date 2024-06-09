part of 'user_edit_info.dart';

@immutable
abstract class UserEditState {}

class UserInitialState extends UserEditState {}

class UserEditInfoLoading extends UserEditState {}

class UserEditInfoSuccess extends UserEditState {}

class UserEditInfoError extends UserEditState {
  final String message;
  UserEditInfoError(this.message);
}
