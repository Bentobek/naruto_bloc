import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
part 'characters_model.g.dart';

@JsonSerializable()
class CharactersModel {
  final int id;
  final String name;
  final List<String> images;
  final Debut? debut;
  final List<String>? jutsu;
  final String? clan;
  final Family? family;


  CharactersModel({
    required this.id,
    required this.name,
    required this.images,
    this.debut,
    this.jutsu,
    this.family,
    this.clan,
  });

  factory CharactersModel.fromJson(Map<String, dynamic> json) =>
      _$CharactersModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersModelToJson(this);
}

@JsonSerializable()
class Debut {
  final String? manga;
  final String? anime;
  final String? novel;
  final String? movie;
  final String? game;
  final String? ova;
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

  Map<String, dynamic> toJson() => _$DebutToJson(this);
}
@JsonSerializable()
class Family {
  final String? father;
  final String? mother;
  final String? son;
  final String? daughter;
  final String? wife;
  final String? adoptiveSon;
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

  Map<String, dynamic> toJson() => _$FamilyToJson(this);
}

