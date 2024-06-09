// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'Api/Account_Managment/User_edit_info/user_edit_info.dart' as _i18;
import 'Api/Account_Managment/User_info/user_info_cubit.dart' as _i19;
import 'Api/Account_Managment/Users_cubit/users_cubit.dart' as _i16;
import 'Api/Auth/Auth_token_cubit/auth_cubit.dart' as _i15;
import 'Api/Auth/Forgot_password_cubit/forgot_cubit.dart' as _i9;
import 'Api/Auth/Login_cubit/login_cubit.dart' as _i17;
import 'Api/Posts/create_post_cubit/create_post_cubit.dart' as _i10;
import 'Api/Posts/delete_post_cubit/delete_post_cubit.dart' as _i11;
import 'Api/Posts/edit_post_cubit/edit_post_cubit.dart' as _i12;
import 'Api/Posts/get_posts_cubit/get_posts_cubit.dart' as _i13;
import 'Api/Posts/vote_post_cubit/vote_post_cubit.dart' as _i14;
import 'Domain/eventbus.dart' as _i4;
import 'Domain/Interfaces/auth_interface.dart' as _i7;
import 'Infrastructure/auth_repo.dart' as _i8;
import 'Infrastructure/dio_client.dart' as _i3;
import 'Infrastructure/posts_repo.dart' as _i5;
import 'Infrastructure/user_manager_repo.dart' as _i6;

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
    gh.lazySingleton<_i4.EventBusManager>(() => _i4.EventBusManager());
    gh.lazySingleton<_i5.PostsRepo>(() => _i5.PostsRepo());
    gh.lazySingleton<_i6.UserManagerRepo>(() => _i6.UserManagerRepo());
    gh.lazySingleton<_i7.AuthInterface>(() => _i8.AuthService());
    gh.lazySingleton<_i9.ForgotPasswordCubit>(
        () => _i9.ForgotPasswordCubit(gh<_i7.AuthInterface>()));
    gh.lazySingleton<_i10.CreatePostCubit>(
        () => _i10.CreatePostCubit(postsRepo: gh<_i5.PostsRepo>()));
    gh.lazySingleton<_i11.DeletePostCubit>(
        () => _i11.DeletePostCubit(postsRepo: gh<_i5.PostsRepo>()));
    gh.lazySingleton<_i12.EditPostCubit>(
        () => _i12.EditPostCubit(postsRepo: gh<_i5.PostsRepo>()));
    gh.lazySingleton<_i13.GetPostsCubit>(
        () => _i13.GetPostsCubit(postsRepo: gh<_i5.PostsRepo>()));
    gh.lazySingleton<_i14.VotePostCubit>(
        () => _i14.VotePostCubit(postsRepo: gh<_i5.PostsRepo>()));
    gh.lazySingleton<_i15.AuthCubit>(
        () => _i15.AuthCubit(gh<_i7.AuthInterface>()));
    gh.lazySingleton<_i16.UsersCubit>(
        () => _i16.UsersCubit(gh<_i6.UserManagerRepo>()));
    gh.lazySingleton<_i17.LoginCubit>(() => _i17.LoginCubit(
          gh<_i7.AuthInterface>(),
          gh<_i15.AuthCubit>(),
        ));
    gh.lazySingleton<_i18.UserEditInfoCubit>(() => _i18.UserEditInfoCubit(
          gh<_i6.UserManagerRepo>(),
          gh<_i15.AuthCubit>(),
        ));
    gh.lazySingleton<_i19.UserInfoCubit>(() => _i19.UserInfoCubit(
          gh<_i6.UserManagerRepo>(),
          gh<_i15.AuthCubit>(),
        ));
    return this;
  }
}
