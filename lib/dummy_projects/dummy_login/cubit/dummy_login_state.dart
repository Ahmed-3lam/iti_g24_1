part of 'dummy_login_cubit.dart';

@immutable
sealed class DummyLoginState {}

final class DummyLoginInitial extends DummyLoginState {}

final class DummyLoginLoading extends DummyLoginState {}

final class DummyLoginSuccess extends DummyLoginState {}

final class DummyLoginError extends DummyLoginState {}
