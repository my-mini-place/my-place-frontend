import 'package:basics/Domain/Interfaces/auth_interface.dart';
import 'package:basics/Domain/auth_entities/reset_password.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'forgot_state.dart';

@LazySingleton()
class ForgotPasswordCubit extends Cubit<ForgotState> {
  ForgotPasswordCubit(this._authservice) : super(ForgotInitial());

  final AuthInterface _authservice;

  Future<void> forgotPassword(String email) async {
    emit(ForgotLoading());

    var response = await _authservice.forgotPassword(email);

    response.fold((l) => emit(ForgotError()), (voids) => emit(ForgotSuccess()));
  }

  Future<void> resetPassword(ResetPassword resetPassword) async {
    emit(ResetLoading());

    var response = await _authservice.resetPassword(resetPassword);

    response.fold((l) => emit(ResetError()), (voids) => emit(ResetSuccess()));
  }
}
