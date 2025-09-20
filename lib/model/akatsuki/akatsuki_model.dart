import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'akatsuki_model.g.dart';

@JsonSerializable()
class AkatsukiModel {
  final String name;
  final List <String> images;

  AkatsukiModel({
    required this.name,
    required this.images,
  });
  factory AkatsukiModel.fromJson(Map<String, dynamic> json) => _$AkatsukiModelFromJson(json);


}
String parseToJson(List<AkatsukiModel> list){

  List<Map<String, dynamic>> objectMaps = list.map((obj)=>_$AkatsukiModelToJson(obj)).toList();
  String jsonString = json.encode(objectMaps);

  return jsonString;
}

