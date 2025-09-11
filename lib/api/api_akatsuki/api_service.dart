import 'package:dio/dio.dart';
import 'package:naruto_bloc/model/akatsuki/akatsuki_model.dart';

class ApiService{


  Future<List<AkatsukiModel>> getAkatsuki() async {
    try {
      final dio = Dio();
      final response = await dio.get('https://dattebayo-api.onrender.com/akatsuki'); // Replace with your actual API endpoint

      if (response.statusCode == 200) {
        final List<dynamic> rawData = response.data['akatsuki'];
        return rawData.map((itemJson) => AkatsukiModel.fromJson(itemJson)).toList();
      } else {
        throw Exception('Failed to load items: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching items: $e');
    }
  }
}