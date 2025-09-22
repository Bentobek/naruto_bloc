part of 'dog_cubit.dart';

@immutable
sealed class DogState {}

final class DogInitial extends DogState {}

final class Loading extends DogState {}

final class Error extends DogState {}

final class Success extends DogState {
  final List<String> imageUrl;

  Success({required this.imageUrl});
}
