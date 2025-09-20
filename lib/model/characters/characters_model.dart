import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'characters_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class CharactersModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final List<String> images;

  @HiveField(3)
  final Debut? debut;

  @HiveField(4)
  final List<String>? jutsu;

  @HiveField(5)
  final Family? family;


  CharactersModel({
    required this.id,
    required this.name,
    required this.images,
    this.debut,
    this.jutsu,
    this.family,
  });

  factory CharactersModel.fromJson(Map<String, dynamic> json) =>
      _$CharactersModelFromJson(json);
}

@HiveType(typeId: 1)
@JsonSerializable()
class Debut {
  @HiveField(0)
  final String? manga;
  @HiveField(1)
  final String? anime;
  @HiveField(2)
  final String? novel;
  @HiveField(3)
  final String? movie;
  @HiveField(4)
  final String? game;
  @HiveField(5)
  final String? ova;
  @HiveField(6)
  final String? appearsIn;

  Debut({
     this.manga,
     this.anime,
     this.novel,
     this.movie,
     this.game,
     this.ova,
     this.appearsIn,
  });

  factory Debut.fromJson(Map<String, dynamic> json) => _$DebutFromJson(json);
}

@HiveType(typeId: 2)
@JsonSerializable()
class Family {
  @HiveField(0)
  final String? father;
  @HiveField(1)
  final String? mother;
  @HiveField(2)
  final String? son;
  @HiveField(3)
  final String? daughter;
  @HiveField(4)
  final String? wife;
  @HiveField(5)
  final String?adoptiveSon;
  @HiveField(6)
  final String? godfather;

  Family({
     this.father,
     this.mother,
     this.son,
     this.daughter,
     this.wife,
     this.adoptiveSon,
     this.godfather,
  });

  factory Family.fromJson(Map<String, dynamic> json) => _$FamilyFromJson(json);
}


