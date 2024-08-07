part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeBannerLoading extends HomeState {}

final class HomeBannerSuccess extends HomeState {}

final class HomeBannerError extends HomeState {}

final class HomeProductsLoading extends HomeState {}

final class HomeProductsSuccess extends HomeState {}

final class HomeProductsError extends HomeState {}
