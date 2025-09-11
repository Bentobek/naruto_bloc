// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersModel _$CharactersModelFromJson(
  Map<String, dynamic> json,
) => CharactersModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  debut: json['debut'] == null
      ? null
      : Debut.fromJson(json['debut'] as Map<String, dynamic>),
  jutsu: (json['jutsu'] as List<dynamic>?)?.map((e) => e as String).toList(),
  family: json['family'] == null
      ? null
      : Family.fromJson(json['family'] as Map<String, dynamic>),
  clan: json['clan'] as String?,
);

Map<String, dynamic> _$CharactersModelToJson(CharactersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'images': instance.images,
      'debut': instance.debut,
      'jutsu': instance.jutsu,
      'clan': instance.clan,
      'family': instance.family,
    };

Debut _$DebutFromJson(Map<String, dynamic> json) => Debut(
  manga: json['manga'] as String?,
  anime: json['anime'] as String?,
  novel: json['novel'] as String?,
  movie: json['movie'] as String?,
  game: json['game'] as String?,
  ova: json['ova'] as String?,
  appearsIn: json['appearsIn'] as String?,
);

Map<String, dynamic> _$DebutToJson(Debut instance) => <String, dynamic>{
  'manga': instance.manga,
  'anime': instance.anime,
  'novel': instance.novel,
  'movie': instance.movie,
  'game': instance.game,
  'ova': instance.ova,
  'appearsIn': instance.appearsIn,
};

Family _$FamilyFromJson(Map<String, dynamic> json) => Family(
  father: json['father'] as String?,
  mother: json['mother'] as String?,
  son: json['son'] as String?,
  daughter: json['daughter'] as String?,
  wife: json['wife'] as String?,
  adoptiveSon: json['adoptiveSon'] as String?,
  godfather: json['godfather'] as String?,
);

Map<String, dynamic> _$FamilyToJson(Family instance) => <String, dynamic>{
  'father': instance.father,
  'mother': instance.mother,
  'son': instance.son,
  'daughter': instance.daughter,
  'wife': instance.wife,
  'adoptiveSon': instance.adoptiveSon,
  'godfather': instance.godfather,
};
