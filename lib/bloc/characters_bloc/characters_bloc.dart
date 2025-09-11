import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:naruto_bloc/api/api_characters/api_service_characters.dart';
import 'package:naruto_bloc/model/characters/characters_model.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(CharactersInitial()) {
    on<CharactersEvent>((event, emit)async {
      emit(Loading());
      final response = await ApiServiceCharacters().getCharacters();
      if (response.isNotEmpty) {
        emit(Success(list: response));
      }
    });
  }
}
