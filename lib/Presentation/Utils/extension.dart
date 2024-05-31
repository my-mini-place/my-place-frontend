import 'package:basics/Api/Auth/Auth_token_cubit/auth_cubit.dart';
import 'package:basics/Domain/auth_entities/user_roles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ContextExtension on BuildContext {
  bool get isAdmin {
    final authState = read<AuthCubit>().state;
    if (authState is AuthorizationState) {
      return authState.userRole == Roles.manager ||
          authState.userRole == Roles.administrator;
    }
    return false;
  }
}

bool isAuthenticated(BuildContext context) {
  final authState = context.read<AuthCubit>().state;
  return authState is AuthorizationState;
}

String getUserId(BuildContext context) {
  final authState = context.read<AuthCubit>().state;

  AuthorizationState mapState = authState as AuthorizationState;

  return mapState.userId;
}
