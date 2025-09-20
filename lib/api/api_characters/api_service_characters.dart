import 'package:dio/dio.dart';
import 'package:naruto_bloc/model/characters/characters_model.dart';

class ApiServiceCharacters {

  Future<List<CharactersModel>> getCharacters() async {
    try {
      final dio = Dio();
      final response = await dio.get(
          'https://dattebayo-api.onrender.com/characters');

      print(response.data);

      final List<dynamic> rawData = response.data['characters'];
      return rawData.map((itemJson) => CharactersModel.fromJson(itemJson))
          .toList();
    } catch (e) {
      print("Error fetching items: $e");
      throw Exception('Error fetching items: $e');
    }
  }
}
