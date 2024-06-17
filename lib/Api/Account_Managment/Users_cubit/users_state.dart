part of 'users_cubit.dart';

abstract class UsersState {}

class UsersInitialState extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {
  final PagedList<User> users;
  UsersLoaded(this.users);
}

class UsersError extends UsersState {
  final String message;
  UsersError(this.message);
}
