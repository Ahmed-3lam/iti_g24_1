part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String msg;
  LoginSuccess(this.msg);
}

final class LoginError extends LoginState {
  final String msg;
  LoginError(this.msg);
}
