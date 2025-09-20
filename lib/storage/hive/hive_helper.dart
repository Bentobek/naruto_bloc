import 'package:hive_flutter/hive_flutter.dart';
import 'package:naruto_bloc/model/characters/characters_model.dart';

class HiveHelper {
  static const String boxName = 'charactersBox';

  Future<void> addCharacters(List<CharactersModel> characters) async {
    final box = await Hive.openBox<CharactersModel>(boxName);
    await box.clear();
    await box.addAll(characters);
  }

  Future<List<CharactersModel>> getCharacters() async {
    final box = await Hive.openBox<CharactersModel>(boxName);
    return box.values.toList();
  }
}