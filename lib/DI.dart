import 'package:basics/Api/Account_Managment/User_info/user_info_cubit.dart';
import 'package:basics/Api/Account_Managment/Users_cubit/users_cubit.dart';
import 'package:basics/Api/Auth_token_cubit/auth_cubit.dart';
import 'package:basics/Api/Forgot_password_cubit/forgot_cubit.dart';
import 'package:basics/Api/Login_cubit/login_cubit.dart';
import 'package:basics/DI.config.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();

class DependencyInjection extends StatelessWidget {
  const DependencyInjection({super.key, required this.inputWidget});

  final Widget inputWidget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<AuthCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<LoginCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<ForgotPasswordCubit>(),
        ),
        BlocProvider(create: (context) => getIt.get<UsersCubit>()),
        BlocProvider(create: (context) => getIt.get<UserInfoCubit>()),
      ],
      child: inputWidget,
    );
  }
}
