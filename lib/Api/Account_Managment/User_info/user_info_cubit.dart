import 'package:basics/Api/Auth/Auth_token_cubit/auth_cubit.dart';
import 'package:basics/DI.dart';
import 'package:basics/Domain/account_manager/userdetails.dart';
import 'package:basics/Domain/eventbus.dart';
import 'package:basics/Domain/logoutevent.dart';
import 'package:bloc/bloc.dart';

import 'package:basics/Infrastructure/user_manager_repo.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'package:injectable/injectable.dart';
part 'user_info_state.dart';

@LazySingleton()
class UserInfoCubit extends Cubit<UserState> {
  final UserManagerRepo userManagerRepo;

  final EventBusManager eventBusManager = getIt.get<EventBusManager>();

  final AuthCubit authCubit;
  UserInfoCubit(this.userManagerRepo, this.authCubit)
      : super(UserInitialState()) {
    eventBusManager.eventBus.on<UserLogoutEvent>().listen((event) {
      emit(UserInitialState());
    });
  }

  Future<void> getUserInfo(String userId) async {
    emit(UserInfoLoading());
    final authState = authCubit.state;
    if (authState is AuthorizationState) {
      final result = await userManagerRepo.getUserInfo(
          userId, authState.token.accessToken);
      result.fold(
        (error) => emit(UserInfoError(error)),
        (userInfo) => emit(UserInfoLoaded(userInfo)),
      );
    } else {
      emit(UserInfoError('Invalid token not authorized'));
    }
  }
}
