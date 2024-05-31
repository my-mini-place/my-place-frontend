import 'package:basics/Domain/account_manager/User.dart';
import 'package:basics/Domain/account_manager/userdetails.dart';
import 'package:basics/Infrastructure/user_manager_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
part 'users_state.dart';

@LazySingleton()
class UsersCubit extends Cubit<UsersState> {
  final UserManagerRepo userManagerRepo;

  UsersCubit(this.userManagerRepo) : super(UsersInitialState());

  Future<void> getAllUsers() async {
    emit(UsersLoading());
    final result = await userManagerRepo.getAllUsers();
    result.fold(
      (error) => emit(UsersError(error)),
      (users) => emit(UsersLoaded(users)),
    );
  }

  Future<void> changeUserInfo() async {}

  Future<void> changeUserRole() async {}

  Future<void> deleteUser() async {}
}
