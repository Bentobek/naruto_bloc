import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:naruto_bloc/api/api_characters/api_service_characters.dart';
import 'package:naruto_bloc/model/characters/characters_model.dart';
import 'package:naruto_bloc/storage/hive/hive_helper.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final ApiServiceCharacters apiService;
  final HiveHelper hiveHelper;

  CharactersBloc({required this.apiService, required this.hiveHelper})
      : super(Loading()) {
    on<GetCharactersEvent>(_onLoadCharacters);
    on<AddCharacters>(_onAddCharacters);
  }

  Future<void> _onLoadCharacters(
      GetCharactersEvent event, Emitter<CharactersState> emit) async {
    emit(Loading());

    try {
      final local = await hiveHelper.getCharacters();
      if (local.isNotEmpty) {
        emit(Success(local));
      } else {
        final list = await apiService.getCharacters();
        await hiveHelper.addCharacters(list);
        emit(Success(list));
      }
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  Future<void> _onAddCharacters(
      AddCharacters event, Emitter<CharactersState> emit) async {
    await hiveHelper.addCharacters(event.characters);
    add(GetCharactersEvent());
  }
}
