part of 'api_list_cubit.dart';

@immutable
sealed class ApiListState {}

final class ApiListInitial extends ApiListState {}

final class ApiListLoading extends ApiListState {}

final class ApiListSuccess extends ApiListState {}

final class ApiListError extends ApiListState {}
