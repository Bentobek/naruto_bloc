part of 'characters_bloc.dart';

@immutable
abstract class CharactersEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class GetCharactersEvent extends CharactersEvent{}

class AddCharacters extends CharactersEvent {
  final List<CharactersModel> characters;
  AddCharacters(this.characters);
}