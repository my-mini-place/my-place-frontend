import 'package:basics/Api/Auth_token_cubit/auth_cubit.dart';
import 'package:basics/Domain/Interfaces/auth_interface.dart';

import 'package:basics/Domain/auth_entities/login.dart';
import 'package:basics/Domain/auth_entities/register.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';

@LazySingleton()
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authservice, this._authcubit) : super(LoginInitial());

  final AuthInterface _authservice;
  final AuthCubit _authcubit;

  Future<void> register(Register register) async {
    emit(LoginLoading());
    var response = await _authservice.register(register);

    response.fold((error) => emit(LoginError()), (token) async {
      //  emit(LoginAuthorized());

      await login(Login(register.Email, register.Password));
      // _authcubit.setToken();
    });
  }

  Future<void> login(Login login) async {
    emit(LoginLoading());
    var response = await _authservice.login(login.email, login.pass);

    response.fold((error) => emit(LoginError()), (token) {
      emit(LoginAuthorized());
      _authcubit.setToken(token);
    });
  }

  Future<void> logout() async {
    //  await _authservice.logout("aa");
    _authcubit.logout();
    emit(LoginInitial());
  }
}
