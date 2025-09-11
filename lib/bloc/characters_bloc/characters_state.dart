part of 'characters_bloc.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

final class Loading extends CharactersState {}

final class Success extends CharactersState {
  final List<CharactersModel> list;

  Success({required this.list});
}
class CharactersError extends CharactersState {
  final String message;
  CharactersError(this.message);
}
