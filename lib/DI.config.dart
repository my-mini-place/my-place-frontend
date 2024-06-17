// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'Api/Account_Managment/User_edit_info/user_edit_info.dart' as _i20;
import 'Api/Account_Managment/User_info/user_info_cubit.dart' as _i21;
import 'Api/Account_Managment/Users_cubit/users_cubit.dart' as _i18;
import 'Api/Auth/Auth_token_cubit/auth_cubit.dart' as _i17;
import 'Api/Auth/Forgot_password_cubit/forgot_cubit.dart' as _i11;
import 'Api/Auth/Login_cubit/login_cubit.dart' as _i19;
import 'Api/Posts/create_post_cubit/create_post_cubit.dart' as _i12;
import 'Api/Posts/delete_post_cubit/delete_post_cubit.dart' as _i13;
import 'Api/Posts/edit_post_cubit/edit_post_cubit.dart' as _i14;
import 'Api/Posts/get_posts_cubit/get_posts_cubit.dart' as _i15;
import 'Api/Posts/vote_post_cubit/vote_post_cubit.dart' as _i16;
import 'Domain/eventbus.dart' as _i4;
import 'Domain/Interfaces/auth_interface.dart' as _i9;
import 'Infrastructure/auth_repo.dart' as _i10;
import 'Infrastructure/bloc_repo.dart' as _i5;
import 'Infrastructure/dio_client.dart' as _i3;
import 'Infrastructure/posts_repo.dart' as _i6;
import 'Infrastructure/residences_repo.dart' as _i7;
import 'Infrastructure/user_manager_repo.dart' as _i8;

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
    gh.lazySingleton<_i5.BlockManagerRepo>(() => _i5.BlockManagerRepo());
    gh.lazySingleton<_i6.PostsRepo>(() => _i6.PostsRepo());
    gh.lazySingleton<_i7.ResidenceManagerRepo>(
        () => _i7.ResidenceManagerRepo());
    gh.lazySingleton<_i8.UserManagerRepo>(() => _i8.UserManagerRepo());
    gh.lazySingleton<_i9.AuthInterface>(() => _i10.AuthService());
    gh.lazySingleton<_i11.ForgotPasswordCubit>(
        () => _i11.ForgotPasswordCubit(gh<_i9.AuthInterface>()));
    gh.lazySingleton<_i12.CreatePostCubit>(
        () => _i12.CreatePostCubit(postsRepo: gh<_i6.PostsRepo>()));
    gh.lazySingleton<_i13.DeletePostCubit>(
        () => _i13.DeletePostCubit(postsRepo: gh<_i6.PostsRepo>()));
    gh.lazySingleton<_i14.EditPostCubit>(
        () => _i14.EditPostCubit(postsRepo: gh<_i6.PostsRepo>()));
    gh.lazySingleton<_i15.GetPostsCubit>(
        () => _i15.GetPostsCubit(postsRepo: gh<_i6.PostsRepo>()));
    gh.lazySingleton<_i16.VotePostCubit>(
        () => _i16.VotePostCubit(postsRepo: gh<_i6.PostsRepo>()));
    gh.lazySingleton<_i17.AuthCubit>(
        () => _i17.AuthCubit(gh<_i9.AuthInterface>()));
    gh.lazySingleton<_i18.UsersCubit>(
        () => _i18.UsersCubit(gh<_i8.UserManagerRepo>()));
    gh.lazySingleton<_i19.LoginCubit>(() => _i19.LoginCubit(
          gh<_i9.AuthInterface>(),
          gh<_i17.AuthCubit>(),
        ));
    gh.lazySingleton<_i20.UserEditInfoCubit>(() => _i20.UserEditInfoCubit(
          gh<_i8.UserManagerRepo>(),
          gh<_i17.AuthCubit>(),
        ));
    gh.lazySingleton<_i21.UserInfoCubit>(() => _i21.UserInfoCubit(
          gh<_i8.UserManagerRepo>(),
          gh<_i17.AuthCubit>(),
        ));
    return this;
  }
}
