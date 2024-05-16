import 'package:basics/Api/Auth_token_cubit/auth_cubit.dart';
import 'package:basics/Domain/Interfaces/auth_interface.dart';
import 'package:basics/Domain/Login.dart';
import 'package:basics/Domain/register.dart';
import 'package:basics/Domain/token.dart';

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
    var response = await _authservice.register(
        register.name, register.pass, register.confirmpass);

    response.fold((error) => emit(LoginError()), (token) {
      emit(LoginAuthorized());
      _authcubit.setToken(token);
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
    late Token token;
    AuthState state = _authcubit.state;
    if (state is AuthorizationState) {
      token = state.token;
    }

    await _authservice.logout(token.idToken);
    _authcubit.logout();
    emit(LoginInitial());
  }
}
