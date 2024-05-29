part of 'user_info_cubit.dart';

@immutable
abstract class UserState {}

class UserInitialState extends UserState {}

class UserInfoLoading extends UserState {}

class UserInfoLoaded extends UserState {
  final UserFullInfo userInfo;
  UserInfoLoaded(this.userInfo);
}

class UserInfoError extends UserState {
  final String message;
  UserInfoError(this.message);
}
