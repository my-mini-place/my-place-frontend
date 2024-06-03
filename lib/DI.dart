import 'package:basics/Api/Account_Managment/User_info/user_info_cubit.dart';
import 'package:basics/Api/Account_Managment/Users_cubit/users_cubit.dart';
import 'package:basics/Api/Auth/Auth_token_cubit/auth_cubit.dart';
import 'package:basics/Api/Auth/Forgot_password_cubit/forgot_cubit.dart';
import 'package:basics/Api/Auth/Login_cubit/login_cubit.dart';
import 'package:basics/Api/Posts/create_post_cubit/create_post_cubit.dart';
import 'package:basics/Api/Posts/delete_post_cubit/delete_post_cubit.dart';
import 'package:basics/Api/Posts/edit_post_cubit/edit_post_cubit.dart';
import 'package:basics/Api/Posts/get_posts_cubit/get_posts_cubit.dart';
import 'package:basics/Api/Posts/vote_post_cubit/vote_post_cubit.dart';
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
        BlocProvider(create: (context) => getIt.get<GetPostsCubit>()),
        BlocProvider(create: (context) => getIt.get<CreatePostCubit>()),
        BlocProvider(create: (context) => getIt.get<DeletePostCubit>()),
        BlocProvider(create: (context) => getIt.get<VotePostCubit>()),
        BlocProvider(create: (context) => getIt.get<EditPostCubit>()),
      ],
      child: inputWidget,
    );
  }
}
