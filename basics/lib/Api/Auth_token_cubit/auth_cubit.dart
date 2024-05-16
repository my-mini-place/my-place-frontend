import 'package:basics/Api/Auth_token_cubit/auth_cubit.dart';
import 'package:basics/Domain/Interfaces/auth_interface.dart';
import 'package:basics/Domain/auth_entities/token.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'Auth_state.dart';

@LazySingleton()
class AuthCubit extends HydratedCubit<AuthState> {
  final AuthInterface service;
  AuthCubit(this.service) : super(AuthorizationInitial());

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    String type = json['type'];
    switch (type) {
      case 'AuthorizationState':
        return AuthorizationState(json['token']);
      case 'AuthorizationInitial':
        return AuthorizationInitial();
      default:
        throw UnimplementedError('State type not supported');
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    if (state is AuthorizationState) {
      return {
        'type': 'AuthorizationState',
        'token': state.token,
      };
    } else if (state is AuthorizationInitial) {
      return {'type': 'AuthorizationInitial'};
    }
    return null;
  }

  void logout() {
    emit(AuthorizationInitial());
  }

  void setToken(Token token) {
    emit(AuthorizationState(token));
  }

  // @override
  // AuthorizationState fromJson(Map<String, dynamic>? json) {
  //   return AuthorizationState.fromJson(json);
  // }

  // @override
  // Map<String, dynamic>? toJson(AuthorizationState state) {
  //   return state.json();
  // }
}
