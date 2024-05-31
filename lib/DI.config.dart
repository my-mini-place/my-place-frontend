// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'Api/Account_Managment/User_info/user_info_cubit.dart' as _i16;
import 'Api/Account_Managment/Users_cubit/users_cubit.dart' as _i14;
import 'Api/Auth/Auth_token_cubit/auth_cubit.dart' as _i13;
import 'Api/Auth/Forgot_password_cubit/forgot_cubit.dart' as _i8;
import 'Api/Auth/Login_cubit/login_cubit.dart' as _i15;
import 'Api/Posts/create_post_cubit/create_post_cubit.dart' as _i9;
import 'Api/Posts/delete_post_cubit/delete_post_cubit.dart' as _i10;
import 'Api/Posts/get_posts_cubit/get_posts_cubit.dart' as _i11;
import 'Api/Posts/vote_post_cubit/vote_post_cubit.dart' as _i12;
import 'Domain/Interfaces/auth_interface.dart' as _i6;
import 'Infrastructure/auth_service.dart' as _i7;
import 'Infrastructure/dio_client.dart' as _i3;
import 'Infrastructure/posts_repo.dart' as _i4;
import 'Infrastructure/user_manager_repo.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.DioClient>(() => _i3.DioClient());
    gh.lazySingleton<_i4.PostsRepo>(() => _i4.PostsRepo());
    gh.lazySingleton<_i5.UserManagerRepo>(() => _i5.UserManagerRepo());
    gh.lazySingleton<_i6.AuthInterface>(() => _i7.AuthService());
    gh.lazySingleton<_i8.ForgotPasswordCubit>(
        () => _i8.ForgotPasswordCubit(gh<_i6.AuthInterface>()));
    gh.lazySingleton<_i9.CreatePostCubit>(
        () => _i9.CreatePostCubit(postsRepo: gh<_i4.PostsRepo>()));
    gh.lazySingleton<_i10.DeletePostCubit>(
        () => _i10.DeletePostCubit(postsRepo: gh<_i4.PostsRepo>()));
    gh.lazySingleton<_i11.GetPostsCubit>(
        () => _i11.GetPostsCubit(postsRepo: gh<_i4.PostsRepo>()));
    gh.lazySingleton<_i12.VotePostCubit>(
        () => _i12.VotePostCubit(postsRepo: gh<_i4.PostsRepo>()));
    gh.lazySingleton<_i13.AuthCubit>(
        () => _i13.AuthCubit(gh<_i6.AuthInterface>()));
    gh.lazySingleton<_i14.UsersCubit>(
        () => _i14.UsersCubit(gh<_i5.UserManagerRepo>()));
    gh.lazySingleton<_i15.LoginCubit>(() => _i15.LoginCubit(
          gh<_i6.AuthInterface>(),
          gh<_i13.AuthCubit>(),
        ));
    gh.lazySingleton<_i16.UserInfoCubit>(() => _i16.UserInfoCubit(
          gh<_i5.UserManagerRepo>(),
          gh<_i13.AuthCubit>(),
        ));
    return this;
  }
}
