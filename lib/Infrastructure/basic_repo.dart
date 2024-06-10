import 'dart:async';

import 'package:basics/Api/Auth/Auth_token_cubit/auth_cubit.dart';
import 'package:basics/DI.dart';

class BasicRepo {
  final AuthCubit authCubit = getIt.get<AuthCubit>();

  late StreamSubscription authCubitSubscription;

  late String accessToken;
  late bool isAuthenticated = false;
  late String userId;

  BasicRepo() {
    AuthState state = authCubit.state;

    if (state is AuthorizationState) {
      isAuthenticated = true;
      accessToken = state.token.accessToken;
      userId = state.userId;
    } else if (state is AuthorizationInitial) {
      accessToken = '';
      isAuthenticated = false;
    }

    authCubitSubscription = authCubit.stream.listen((state) {
      if (state is AuthorizationState) {
        isAuthenticated = true;
        accessToken = state.token.accessToken;
        userId = state.userId;
      } else if (state is AuthorizationInitial) {
        accessToken = '';

        isAuthenticated = false;
      }
    });
  }
}
