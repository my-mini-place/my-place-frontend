import 'dart:io';

import 'package:basics/Api/Auth_token_cubit/auth_cubit.dart';
import 'package:basics/Domain/Interfaces/auth_interface.dart';
import 'package:basics/Domain/auth_entities/token.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart'; // Add path_provider package for directory handling
import 'package:path/path.dart' as path;

void main() {
  group('Auth Bloc', () {
    late AuthCubit authCubit;

    setUp(() async {
      // Get a temporary directory (ideal for testing environments).
      WidgetsFlutterBinding.ensureInitialized();
      var dir = await getTemporaryDirectory(); // Using path_provider package
      Hive.init(path.join(
          dir.path, 'hive_testing')); // Initialize Hive with this directory

      HydratedBloc.storage =
          await HydratedStorage.build(storageDirectory: Directory(dir.path));

      authCubit = AuthCubit(_MockAuthService());
    });

    blocTest<AuthCubit, AuthState>(
      'emits [AuthorizationState] when setToken is called.',
      build: () => authCubit,
      act: (bloc) => bloc.setToken(Token(accessToken: "2323")),
      expect: () => [AuthorizationState(Token(accessToken: "2323"))],
    );
  });
}

class _MockAuthService extends Mock implements AuthInterface {}
