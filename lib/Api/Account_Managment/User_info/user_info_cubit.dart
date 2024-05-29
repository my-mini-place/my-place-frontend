import 'package:basics/Domain/account_manager/userdetails.dart';
import 'package:bloc/bloc.dart';

import 'package:basics/Infrastructure/user_manager_service.dart';
import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';
part 'user_info_state.dart';

@LazySingleton()
class UserInfoCubit extends Cubit<UserState> {
  final UserManagerRepo userManagerRepo;

  UserInfoCubit(this.userManagerRepo) : super(UserInitialState());

  Future<void> getUserInfo(String userId) async {
    emit(UserInfoLoading());
    final result = await userManagerRepo.getUserInfo(userId);
    result.fold(
      (error) => emit(UserInfoError(error)),
      (userInfo) => emit(UserInfoLoaded(userInfo)),
    );
  }
}
