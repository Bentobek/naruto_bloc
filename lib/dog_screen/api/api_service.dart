import 'package:dio/dio.dart';

class ApiService{

  Future <String> getDog() async{
    final dio = Dio();
    final response = await dio.get('https://dog.ceo/api/breeds/image/random');

    if (response.statusCode ==200){
      return response.data['message'];
    }else{
       return 'Failed to load items';
    }
    }
}