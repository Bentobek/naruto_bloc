import 'dart:convert';

import 'package:naruto_bloc/model/akatsuki/akatsuki_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String akatsukiKey = 'akatsuki';

class PrefHelper{

Future<void> saveMyObject(String value) async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString(akatsukiKey, value);

  }

  Future<List<AkatsukiModel>> loadMyObject() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? jsonString = preferences.getString(akatsukiKey);

    if (jsonString !=null){
      List <dynamic> decodedList = jsonDecode(jsonString);
      return decodedList.map((item)=> AkatsukiModel.fromJson(item as Map<String, dynamic>)).toList();

    }
    return [];
  }
}