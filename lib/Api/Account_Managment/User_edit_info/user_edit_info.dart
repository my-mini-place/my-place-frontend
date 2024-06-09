import 'package:basics/Api/Auth/Auth_token_cubit/auth_cubit.dart';
import 'package:basics/DI.dart';
import 'package:basics/Domain/account_manager/userdetails.dart';
import 'package:basics/Domain/account_manager/usereditInfo.dart';
import 'package:basics/Domain/eventbus.dart';
import 'package:basics/Domain/logoutevent.dart';
import 'package:bloc/bloc.dart';

import 'package:basics/Infrastructure/user_manager_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'package:injectable/injectable.dart';
part 'user_edit_state.dart';

@LazySingleton()
class UserEditInfoCubit extends Cubit<UserEditState> {
  final UserManagerRepo userManagerRepo;

  final EventBusManager eventBusManager = getIt.get<EventBusManager>();

  final AuthCubit authCubit;
  UserEditInfoCubit(this.userManagerRepo, this.authCubit)
      : super(UserInitialState()) {
    eventBusManager.eventBus.on<UserLogoutEvent>().listen((event) {
      emit(UserInitialState());
    });
  }

  Future<void> editUserEditInfo(final String? email, String? name,
      String? surname, String? phoneNumber) async {
    emit(UserEditInfoLoading());

    final result =
        await userManagerRepo.editUserInfo(email, name, surname, phoneNumber);

    result.fold(
      (error) => emit(UserEditInfoError(error)),
      (userEditInfo) => emit(UserEditInfoSuccess()),
    );
  }
}
