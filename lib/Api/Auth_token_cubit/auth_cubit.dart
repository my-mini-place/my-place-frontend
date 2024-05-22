import 'package:basics/Domain/Interfaces/auth_interface.dart';
import 'package:basics/Domain/auth_entities/token.dart';

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'Auth_state.dart';

@LazySingleton()
class AuthCubit extends Cubit<AuthState> with HydratedMixin<AuthState> {
  final AuthInterface service;
  AuthCubit(this.service) : super(AuthorizationInitial()) {
    hydrate();
  }

  @override
  AuthState? fromJson(Map<dynamic, dynamic> json) {
    String type = json['type'];
    switch (type) {
      case 'AuthorizationState':
        return AuthorizationState(Token(accessToken: json['token']));
      case 'AuthorizationInitial':
        return AuthorizationInitial();
      default:
        throw UnimplementedError('State type not supported');
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    if (state is AuthorizationState) {
      // return {
      //   'type': 'AuthorizationState',
      //   'token': state.token,
      // };]
      Map<String, dynamic> result = {};
      result['type'] = 'AuthorizationState';
      result['token'] = state.token.accessToken;

      return result;
    } else if (state is AuthorizationInitial) {
      return {'type': 'AuthorizationInitial'};
    }
    return null;
  }

  // @override
  // Map<String,dynamic> toMap(AuthState state)
  // {

  // }

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
