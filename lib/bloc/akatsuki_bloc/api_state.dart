part of 'api_bloc.dart';

@immutable
sealed class ApiState {}

final class ApiInitial extends ApiState {}

final class Loading extends ApiState {}

final class Success extends ApiState {
  final List<AkatsukiModel> akatsukiList;

  Success({required this.akatsukiList});
}
