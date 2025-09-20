// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'akatsuki_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AkatsukiModel _$AkatsukiModelFromJson(Map<String, dynamic> json) =>
    AkatsukiModel(
      name: json['name'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AkatsukiModelToJson(AkatsukiModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'images': instance.images,
    };
