// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'Api/Auth_token_cubit/auth_cubit.dart' as _i6;
import 'Api/Login_cubit/login_cubit.dart' as _i7;
import 'Domain/Interfaces/auth_interface.dart' as _i4;
import 'Infrastructure/auth_client.dart' as _i5;
import 'Infrastructure/dio_client.dart' as _i3;

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
    gh.lazySingleton<_i4.AuthInterface>(() => _i5.AuthService());
    gh.lazySingleton<_i6.AuthCubit>(
        () => _i6.AuthCubit(gh<_i4.AuthInterface>()));
    gh.lazySingleton<_i7.LoginCubit>(() => _i7.LoginCubit(
          gh<_i4.AuthInterface>(),
          gh<_i6.AuthCubit>(),
        ));
    return this;
  }
}
