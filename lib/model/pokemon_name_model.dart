import 'dart:convert';

NamePokemonModel namePokemonModelFromJson(String str) =>
    NamePokemonModel.fromJson(json.decode(str));

class NamePokemonModel {
  final List<Ability> abilities;
  final int height;
  final int id;
  final String name;
  final Sprites sprites;
  final List<Stat> stats;
  final int weight;
  final List<Type> types;

  NamePokemonModel({
    required this.abilities,
    required this.height,
    required this.id,
    required this.name,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  factory NamePokemonModel.fromJson(Map<String, dynamic> json) =>
      NamePokemonModel(
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromJson(x))),
        height: json["height"] ?? 0,
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        sprites: Sprites.fromJson(json["sprites"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        weight: json["weight"] ?? 0,
      );
}

class Ability {
  final Species ability;
  final bool isHidden;
  final int slot;

  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "ability": ability.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class Species {
  final String name;
  final String url;

  Species({
    required this.name,
    required this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"] ?? "",
        url: json["url"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Other {
  final OfficialArtwork officialArtwork;

  Other({
    required this.officialArtwork,
  });

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
      );

  Map<String, dynamic> toJson() => {
        "official-artwork": officialArtwork.toJson(),
      };
}

class Sprites {
  final String frontDefault;
  final Other other;

  Sprites({
    required this.frontDefault,
    required this.other,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        frontDefault: json["front_default"] ?? "",
        other: Other.fromJson(json["other"]),
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
      };
}

class OfficialArtwork {
  final String frontDefault;
  final String frontShiny;

  OfficialArtwork({
    required this.frontDefault,
    required this.frontShiny,
  });

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json["front_default"] ?? "",
        frontShiny: json["front_shiny"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class Stat {
  final int baseStat;
  final int effort;
  final Species stat;

  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"] ?? 0,
        effort: json["effort"] ?? 0,
        stat: Species.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toJson(),
      };
}

class Type {
  final int slot;
  final Species type;

  Type({
    required this.slot,
    required this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"] ?? 0,
        type: Species.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}
