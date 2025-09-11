part of 'characters_bloc.dart';

@immutable
sealed class CharactersEvent {}

final class GetCharactersEvent extends CharactersEvent{}
