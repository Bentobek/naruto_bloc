part of 'characters_bloc.dart';

@immutable
abstract class CharactersState extends Equatable {
  @override
  List<Object?> get props => [];
}
final class CharactersInitial extends CharactersState {}

class Loading extends CharactersState {}

class Success extends CharactersState {
  final List<CharactersModel> list;
  Success(this.list);

  @override
  List<Object?> get props => [list];
}

class Error extends CharactersState {
  final String message;
  Error(this.message);

  @override
  List<Object?> get props => [message];
}