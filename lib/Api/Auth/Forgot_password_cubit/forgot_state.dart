part of 'forgot_cubit.dart';

@immutable
sealed class ForgotState {}

final class ForgotInitial extends ForgotState {}

final class ForgotLoading extends ForgotState {}

final class ForgotError extends ForgotState {}

final class ForgotSuccess extends ForgotState {}

final class ResetInitial extends ForgotState {}

final class ResetLoading extends ForgotState {}

final class ResetError extends ForgotState {}

final class ResetSuccess extends ForgotState {}
