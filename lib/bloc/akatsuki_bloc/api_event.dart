part of 'api_bloc.dart';

@immutable
sealed class ApiEvent {}

final class GetAkatsukiEvent extends ApiEvent{}
