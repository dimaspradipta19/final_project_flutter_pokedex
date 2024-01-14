// // To parse this JSON data, do
// //
// //     final namePokemonModel = namePokemonModelFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

NamePokemonModel namePokemonModelFromJson(String str) =>
    NamePokemonModel.fromJson(json.decode(str));

String namePokemonModelToJson(NamePokemonModel data) =>
    json.encode(data.toJson());

class NamePokemonModel {
  final List<Ability> abilities;
  final int baseExperience;
  final List<Species> forms;
  final List<GameIndex> gameIndices;
  final int height;
  final List<HeldItem> heldItems;
  final int id;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<Move> moves;
  final String name;
  final int order;
  final List<dynamic> pastAbilities;
  final List<dynamic> pastTypes;
  final Species species;
  final Sprites sprites;
  final List<Stat> stats;
  final List<Type> types;
  final int weight;

  NamePokemonModel({
    required this.abilities,
    required this.baseExperience,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastAbilities,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  factory NamePokemonModel.fromJson(Map<String, dynamic> json) =>
      NamePokemonModel(
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromJson(x))),
        baseExperience: json["base_experience"],
        forms:
            List<Species>.from(json["forms"].map((x) => Species.fromJson(x))),
        gameIndices: List<GameIndex>.from(
            json["game_indices"].map((x) => GameIndex.fromJson(x))),
        height: json["height"],
        heldItems: List<HeldItem>.from(
            json["held_items"].map((x) => HeldItem.fromJson(x))),
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
        name: json["name"],
        order: json["order"],
        pastAbilities: List<dynamic>.from(json["past_abilities"].map((x) => x)),
        pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
        species: Species.fromJson(json["species"]),
        sprites: Sprites.fromJson(json["sprites"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "base_experience": baseExperience,
        "forms": List<dynamic>.from(forms.map((x) => x.toJson())),
        "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toJson())),
        "height": height,
        "held_items": List<dynamic>.from(heldItems.map((x) => x.toJson())),
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
        "name": name,
        "order": order,
        "past_abilities": List<dynamic>.from(pastAbilities.map((x) => x)),
        "past_types": List<dynamic>.from(pastTypes.map((x) => x)),
        "species": species.toJson(),
        "sprites": sprites.toJson(),
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "weight": weight,
      };
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
        slot: json["slot"],
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
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class GameIndex {
  final int gameIndex;
  final Species version;

  GameIndex({
    required this.gameIndex,
    required this.version,
  });

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        version: Species.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
        "game_index": gameIndex,
        "version": version.toJson(),
      };
}

class HeldItem {
  final Species item;
  final List<VersionDetail> versionDetails;

  HeldItem({
    required this.item,
    required this.versionDetails,
  });

  factory HeldItem.fromJson(Map<String, dynamic> json) => HeldItem(
        item: Species.fromJson(json["item"]),
        versionDetails: List<VersionDetail>.from(
            json["version_details"].map((x) => VersionDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "item": item.toJson(),
        "version_details":
            List<dynamic>.from(versionDetails.map((x) => x.toJson())),
      };
}

class VersionDetail {
  final int rarity;
  final Species version;

  VersionDetail({
    required this.rarity,
    required this.version,
  });

  factory VersionDetail.fromJson(Map<String, dynamic> json) => VersionDetail(
        rarity: json["rarity"],
        version: Species.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
        "rarity": rarity,
        "version": version.toJson(),
      };
}

class Move {
  final Species move;
  final List<VersionGroupDetail> versionGroupDetails;

  Move({
    required this.move,
    required this.versionGroupDetails,
  });

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: Species.fromJson(json["move"]),
        versionGroupDetails: List<VersionGroupDetail>.from(
            json["version_group_details"]
                .map((x) => VersionGroupDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "move": move.toJson(),
        "version_group_details":
            List<dynamic>.from(versionGroupDetails.map((x) => x.toJson())),
      };
}

class VersionGroupDetail {
  final int levelLearnedAt;
  final Species moveLearnMethod;
  final Species versionGroup;

  VersionGroupDetail({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) =>
      VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        moveLearnMethod: Species.fromJson(json["move_learn_method"]),
        versionGroup: Species.fromJson(json["version_group"]),
      );

  Map<String, dynamic> toJson() => {
        "level_learned_at": levelLearnedAt,
        "move_learn_method": moveLearnMethod.toJson(),
        "version_group": versionGroup.toJson(),
      };
}

class GenerationV {
  final Sprites blackWhite;

  GenerationV({
    required this.blackWhite,
  });

  factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
        blackWhite: Sprites.fromJson(json["black-white"]),
      );

  Map<String, dynamic> toJson() => {
        "black-white": blackWhite.toJson(),
      };
}

class GenerationIv {
  final Sprites diamondPearl;
  final Sprites heartgoldSoulsilver;
  final Sprites platinum;

  GenerationIv({
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
    required this.platinum,
  });

  factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
        diamondPearl: Sprites.fromJson(json["diamond-pearl"]),
        heartgoldSoulsilver: Sprites.fromJson(json["heartgold-soulsilver"]),
        platinum: Sprites.fromJson(json["platinum"]),
      );

  Map<String, dynamic> toJson() => {
        "diamond-pearl": diamondPearl.toJson(),
        "heartgold-soulsilver": heartgoldSoulsilver.toJson(),
        "platinum": platinum.toJson(),
      };
}

class Versions {
  final GenerationI generationI;
  final GenerationIi generationIi;
  final GenerationIii generationIii;
  final GenerationIv generationIv;
  final GenerationV generationV;
  final Map<String, Home> generationVi;
  final GenerationVii generationVii;
  final GenerationViii generationViii;

  Versions({
    required this.generationI,
    required this.generationIi,
    required this.generationIii,
    required this.generationIv,
    required this.generationV,
    required this.generationVi,
    required this.generationVii,
    required this.generationViii,
  });

  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
        generationI: GenerationI.fromJson(json["generation-i"]),
        generationIi: GenerationIi.fromJson(json["generation-ii"]),
        generationIii: GenerationIii.fromJson(json["generation-iii"]),
        generationIv: GenerationIv.fromJson(json["generation-iv"]),
        generationV: GenerationV.fromJson(json["generation-v"]),
        generationVi: Map.from(json["generation-vi"])
            .map((k, v) => MapEntry<String, Home>(k, Home.fromJson(v))),
        generationVii: GenerationVii.fromJson(json["generation-vii"]),
        generationViii: GenerationViii.fromJson(json["generation-viii"]),
      );

  Map<String, dynamic> toJson() => {
        "generation-i": generationI.toJson(),
        "generation-ii": generationIi.toJson(),
        "generation-iii": generationIii.toJson(),
        "generation-iv": generationIv.toJson(),
        "generation-v": generationV.toJson(),
        "generation-vi": Map.from(generationVi)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "generation-vii": generationVii.toJson(),
        "generation-viii": generationViii.toJson(),
      };
}

class Other {
  final DreamWorld dreamWorld;
  final Home home;
  final OfficialArtwork officialArtwork;
  final Sprites showdown;

  Other({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
    required this.showdown,
  });

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld: DreamWorld.fromJson(json["dream_world"]),
        home: Home.fromJson(json["home"]),
        officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
        showdown: Sprites.fromJson(json["showdown"]),
      );

  Map<String, dynamic> toJson() => {
        "dream_world": dreamWorld.toJson(),
        "home": home.toJson(),
        "official-artwork": officialArtwork.toJson(),
        "showdown": showdown.toJson(),
      };
}

class Sprites {
  final String backDefault;
  final String backFemale;
  final String backShiny;
  final String backShinyFemale;
  final String frontDefault;
  final String frontFemale;
  final String frontShiny;
  final String frontShinyFemale;
  final Other other;
  final Versions versions;
  final Sprites animated;

  Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    required this.other,
    required this.versions,
    required this.animated,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"] ?? "",
        backFemale: json["back_female"] ?? "",
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"] ?? "",
        frontDefault: json["front_default"],
        frontFemale: json["front_female"] ?? "",
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        other: Other.fromJson(json["other"]),
        versions: Versions.fromJson(json["versions"]),
        animated: Sprites.fromJson(json["animated"]),
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "other": other.toJson(),
        "versions": versions.toJson(),
        "animated": animated.toJson(),
      };
}

class GenerationI {
  final RedBlue redBlue;
  final RedBlue yellow;

  GenerationI({
    required this.redBlue,
    required this.yellow,
  });

  factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
        redBlue: RedBlue.fromJson(json["red-blue"]),
        yellow: RedBlue.fromJson(json["yellow"]),
      );

  Map<String, dynamic> toJson() => {
        "red-blue": redBlue.toJson(),
        "yellow": yellow.toJson(),
      };
}

class RedBlue {
  final String backDefault;
  final String backGray;
  final String backTransparent;
  final String frontDefault;
  final String frontGray;
  final String frontTransparent;

  RedBlue({
    required this.backDefault,
    required this.backGray,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontGray,
    required this.frontTransparent,
  });

  factory RedBlue.fromJson(Map<String, dynamic> json) => RedBlue(
        backDefault: json["back_default"],
        backGray: json["back_gray"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontGray: json["front_gray"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_gray": backGray,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_gray": frontGray,
        "front_transparent": frontTransparent,
      };
}

class GenerationIi {
  final Crystal crystal;
  final Gold gold;
  final Gold silver;

  GenerationIi({
    required this.crystal,
    required this.gold,
    required this.silver,
  });

  factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
        crystal: Crystal.fromJson(json["crystal"]),
        gold: Gold.fromJson(json["gold"]),
        silver: Gold.fromJson(json["silver"]),
      );

  Map<String, dynamic> toJson() => {
        "crystal": crystal.toJson(),
        "gold": gold.toJson(),
        "silver": silver.toJson(),
      };
}

class Crystal {
  final String backDefault;
  final String backShiny;
  final String backShinyTransparent;
  final String backTransparent;
  final String frontDefault;
  final String frontShiny;
  final String frontShinyTransparent;
  final String frontTransparent;

  Crystal({
    required this.backDefault,
    required this.backShiny,
    required this.backShinyTransparent,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontShiny,
    required this.frontShinyTransparent,
    required this.frontTransparent,
  });

  factory Crystal.fromJson(Map<String, dynamic> json) => Crystal(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        backShinyTransparent: json["back_shiny_transparent"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontShinyTransparent: json["front_shiny_transparent"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "back_shiny_transparent": backShinyTransparent,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_shiny_transparent": frontShinyTransparent,
        "front_transparent": frontTransparent,
      };
}

class Gold {
  final String backDefault;
  final String backShiny;
  final String frontDefault;
  final String frontShiny;
  final String frontTransparent;

  Gold({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
    required this.frontTransparent,
  });

  factory Gold.fromJson(Map<String, dynamic> json) => Gold(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_transparent": frontTransparent,
      };
}

class GenerationIii {
  final OfficialArtwork emerald;
  final Gold fireredLeafgreen;
  final Gold rubySapphire;

  GenerationIii({
    required this.emerald,
    required this.fireredLeafgreen,
    required this.rubySapphire,
  });

  factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
        emerald: OfficialArtwork.fromJson(json["emerald"]),
        fireredLeafgreen: Gold.fromJson(json["firered-leafgreen"]),
        rubySapphire: Gold.fromJson(json["ruby-sapphire"]),
      );

  Map<String, dynamic> toJson() => {
        "emerald": emerald.toJson(),
        "firered-leafgreen": fireredLeafgreen.toJson(),
        "ruby-sapphire": rubySapphire.toJson(),
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
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class Home {
  final String frontDefault;
  final String frontFemale;
  final String frontShiny;
  final String frontShinyFemale;

  Home({
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"] ?? "",
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}

class GenerationVii {
  final DreamWorld icons;
  final Home ultraSunUltraMoon;

  GenerationVii({
    required this.icons,
    required this.ultraSunUltraMoon,
  });

  factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
        icons: DreamWorld.fromJson(json["icons"]),
        ultraSunUltraMoon: Home.fromJson(json["ultra-sun-ultra-moon"]),
      );

  Map<String, dynamic> toJson() => {
        "icons": icons.toJson(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon.toJson(),
      };
}

class DreamWorld {
  final String frontDefault;
  final String frontFemale;

  DreamWorld({
    required this.frontDefault,
    required this.frontFemale,
  });

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };
}

class GenerationViii {
  final DreamWorld icons;

  GenerationViii({
    required this.icons,
  });

  factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
        icons: DreamWorld.fromJson(json["icons"]),
      );

  Map<String, dynamic> toJson() => {
        "icons": icons.toJson(),
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
        baseStat: json["base_stat"],
        effort: json["effort"],
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
        slot: json["slot"],
        type: Species.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}


// class NamePokemonModel {
//   List<Abilities>? abilities;
//   int? baseExperience;
//   // List<Forms>? forms;
//   List<GameIndices>? gameIndices;
//   int? height;
//   List<HeldItems>? heldItems;
//   int? id;
//   bool? isDefault;
//   String? locationAreaEncounters;
//   List<Moves>? moves;
//   String? name;
//   int? order;
//   // List? pastAbilities;
//   // List? pastTypes;
//   Ability? species;
//   Sprites? sprites;
//   List<Stats>? stats;
//   List<Types>? types;
//   int? weight;

//   NamePokemonModel(
//       {this.abilities,
//       this.baseExperience,
//       // this.forms,
//       this.gameIndices,
//       this.height,
//       this.heldItems,
//       this.id,
//       this.isDefault,
//       this.locationAreaEncounters,
//       this.moves,
//       this.name,
//       this.order,
//       // this.pastAbilities,
//       // this.pastTypes,
//       this.species,
//       this.sprites,
//       this.stats,
//       this.types,
//       this.weight});

//   NamePokemonModel.fromJson(Map<String, dynamic> json) {
//     if (json['abilities'] != null) {
//       abilities = <Abilities>[];
//       json['abilities'].forEach((v) {
//         abilities!.add(Abilities.fromJson(v));
//       });
//     }
//     baseExperience = json['base_experience'];
//     // if (json['forms'] != null) {
//     //   forms = <Forms>[];
//     //   json['forms'].forEach((v) {
//     //     forms!.add(new Forms.fromJson(v));
//     //   });
//     // }
//     if (json['game_indices'] != null) {
//       gameIndices = <GameIndices>[];
//       json['game_indices'].forEach((v) {
//         gameIndices!.add(GameIndices.fromJson(v));
//       });
//     }
//     height = json['height'];
//     if (json['held_items'] != null) {
//       heldItems = <HeldItems>[];
//       json['held_items'].forEach((v) {
//         heldItems!.add(HeldItems.fromJson(v));
//       });
//     }
//     id = json['id'];
//     isDefault = json['is_default'];
//     locationAreaEncounters = json['location_area_encounters'];
//     if (json['moves'] != null) {
//       moves = <Moves>[];
//       json['moves'].forEach((v) {
//         moves!.add(Moves.fromJson(v));
//       });
//     }
//     name = json['name'];
//     order = json['order'];
//     // if (json['past_abilities'] != null) {
//     //   pastAbilities = [];
//     //   json['past_abilities'].forEach((v) {
//     //     pastAbilities!.add(pastAbilities.fromJson(v));
//     //   });
//     // }
//     // if (json['past_types'] != null) {
//     //   pastTypes = [];
//     //   json['past_types'].forEach((v) {
//     //     pastTypes!.add(Null.fromJson(v));
//     //   });
//     // }
//     species =
//         json['species'] != null ? Ability.fromJson(json['species']) : null;
//     sprites =
//         json['sprites'] != null ? Sprites.fromJson(json['sprites']) : null;
//     if (json['stats'] != null) {
//       stats = <Stats>[];
//       json['stats'].forEach((v) {
//         stats!.add(Stats.fromJson(v));
//       });
//     }
//     if (json['types'] != null) {
//       types = <Types>[];
//       json['types'].forEach((v) {
//         types!.add(Types.fromJson(v));
//       });
//     }
//     weight = json['weight'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (abilities != null) {
//       data['abilities'] = abilities!.map((v) => v.toJson()).toList();
//     }
//     data['base_experience'] = baseExperience;
//     // if (this.forms != null) {
//     //   data['forms'] = this.forms!.map((v) => v.toJson()).toList();
//     // }
//     if (gameIndices != null) {
//       data['game_indices'] = gameIndices!.map((v) => v.toJson()).toList();
//     }
//     data['height'] = height;
//     if (heldItems != null) {
//       data['held_items'] = heldItems!.map((v) => v.toJson()).toList();
//     }
//     data['id'] = id;
//     data['is_default'] = isDefault;
//     data['location_area_encounters'] = locationAreaEncounters;
//     if (moves != null) {
//       data['moves'] = moves!.map((v) => v.toJson()).toList();
//     }
//     data['name'] = name;
//     data['order'] = order;
//     // if (pastAbilities != null) {
//     //   data['past_abilities'] = pastAbilities!.map((v) => v.toJson()).toList();
//     // }
//     // if (pastTypes != null) {
//     //   data['past_types'] = pastTypes!.map((v) => v.toJson()).toList();
//     // }
//     if (species != null) {
//       data['species'] = species!.toJson();
//     }
//     if (sprites != null) {
//       data['sprites'] = sprites!.toJson();
//     }
//     if (stats != null) {
//       data['stats'] = stats!.map((v) => v.toJson()).toList();
//     }
//     if (types != null) {
//       data['types'] = types!.map((v) => v.toJson()).toList();
//     }
//     data['weight'] = weight;
//     return data;
//   }
// }

// class Abilities {
//   Ability? ability;
//   bool? isHidden;
//   int? slot;

//   Abilities({this.ability, this.isHidden, this.slot});

//   Abilities.fromJson(Map<String, dynamic> json) {
//     ability =
//         json['ability'] != null ? Ability.fromJson(json['ability']) : null;
//     isHidden = json['is_hidden'];
//     slot = json['slot'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (ability != null) {
//       data['ability'] = ability!.toJson();
//     }
//     data['is_hidden'] = isHidden;
//     data['slot'] = slot;
//     return data;
//   }
// }

// class Ability {
//   String? name;
//   String? url;

//   Ability({this.name, this.url});

//   Ability.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     url = json['url'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['name'] = name;
//     data['url'] = url;
//     return data;
//   }
// }

// class GameIndices {
//   int? gameIndex;
//   Ability? version;

//   GameIndices({this.gameIndex, this.version});

//   GameIndices.fromJson(Map<String, dynamic> json) {
//     gameIndex = json['game_index'];
//     version =
//         json['version'] != null ? Ability.fromJson(json['version']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['game_index'] = gameIndex;
//     if (version != null) {
//       data['version'] = version!.toJson();
//     }
//     return data;
//   }
// }

// class HeldItems {
//   Ability? item;
//   List<VersionDetails>? versionDetails;

//   HeldItems({this.item, this.versionDetails});

//   HeldItems.fromJson(Map<String, dynamic> json) {
//     item = json['item'] != null ? Ability.fromJson(json['item']) : null;
//     if (json['version_details'] != null) {
//       versionDetails = <VersionDetails>[];
//       json['version_details'].forEach((v) {
//         versionDetails!.add(VersionDetails.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (item != null) {
//       data['item'] = item!.toJson();
//     }
//     if (versionDetails != null) {
//       data['version_details'] = versionDetails!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class VersionDetails {
//   int? rarity;
//   Ability? version;

//   VersionDetails({this.rarity, this.version});

//   VersionDetails.fromJson(Map<String, dynamic> json) {
//     rarity = json['rarity'];
//     version =
//         json['version'] != null ? Ability.fromJson(json['version']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['rarity'] = rarity;
//     if (version != null) {
//       data['version'] = version!.toJson();
//     }
//     return data;
//   }
// }

// class Moves {
//   Ability? move;
//   List<VersionGroupDetails>? versionGroupDetails;

//   Moves({this.move, this.versionGroupDetails});

//   Moves.fromJson(Map<String, dynamic> json) {
//     move = json['move'] != null ? Ability.fromJson(json['move']) : null;
//     if (json['version_group_details'] != null) {
//       versionGroupDetails = <VersionGroupDetails>[];
//       json['version_group_details'].forEach((v) {
//         versionGroupDetails!.add(VersionGroupDetails.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (move != null) {
//       data['move'] = move!.toJson();
//     }
//     if (versionGroupDetails != null) {
//       data['version_group_details'] =
//           versionGroupDetails!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class VersionGroupDetails {
//   int? levelLearnedAt;
//   Ability? moveLearnMethod;
//   Ability? versionGroup;

//   VersionGroupDetails(
//       {this.levelLearnedAt, this.moveLearnMethod, this.versionGroup});

//   VersionGroupDetails.fromJson(Map<String, dynamic> json) {
//     levelLearnedAt = json['level_learned_at'];
//     moveLearnMethod = json['move_learn_method'] != null
//         ? Ability.fromJson(json['move_learn_method'])
//         : null;
//     versionGroup = json['version_group'] != null
//         ? Ability.fromJson(json['version_group'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['level_learned_at'] = levelLearnedAt;
//     if (moveLearnMethod != null) {
//       data['move_learn_method'] = moveLearnMethod!.toJson();
//     }
//     if (versionGroup != null) {
//       data['version_group'] = versionGroup!.toJson();
//     }
//     return data;
//   }
// }

// class Sprites {
//   String? backDefault;
//   String? backFemale;
//   String? backShiny;
//   String? backShinyFemale;
//   String? frontDefault;
//   String? frontFemale;
//   String? frontShiny;
//   String? frontShinyFemale;
//   Other? other;
//   Versions? versions;

//   Sprites(
//       {this.backDefault,
//       this.backFemale,
//       this.backShiny,
//       this.backShinyFemale,
//       this.frontDefault,
//       this.frontFemale,
//       this.frontShiny,
//       this.frontShinyFemale,
//       this.other,
//       this.versions});

//   Sprites.fromJson(Map<String, dynamic> json) {
//     backDefault = json['back_default'] ?? "";
//     backFemale = json['back_female'] ?? "";
//     backShiny = json['back_shiny'] ?? "";
//     backShinyFemale = json['back_shiny_female'] ?? "";
//     frontDefault = json['front_default'] ?? "";
//     frontFemale = json['front_female'] ?? "";
//     frontShiny = json['front_shiny'] ?? "";
//     frontShinyFemale = json['front_shiny_female'] ?? "";
//     other = json['other'] != null ? Other.fromJson(json['other']) : null;
//     versions =
//         json['versions'] != null ? Versions.fromJson(json['versions']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['back_default'] = backDefault;
//     data['back_female'] = backFemale;
//     data['back_shiny'] = backShiny;
//     data['back_shiny_female'] = backShinyFemale;
//     data['front_default'] = frontDefault;
//     data['front_female'] = frontFemale;
//     data['front_shiny'] = frontShiny;
//     data['front_shiny_female'] = frontShinyFemale;
//     if (other != null) {
//       data['other'] = other!.toJson();
//     }
//     if (versions != null) {
//       data['versions'] = versions!.toJson();
//     }
//     return data;
//   }
// }

// class Other {
//   DreamWorld? dreamWorld;
//   Home? home;
//   OfficialArtwork? officialArtwork;
//   Showdown? showdown;

//   Other({this.dreamWorld, this.home, this.officialArtwork, this.showdown});

//   Other.fromJson(Map<String, dynamic> json) {
//     dreamWorld = json['dream_world'] != null
//         ? DreamWorld.fromJson(json['dream_world'])
//         : null;
//     home = json['home'] != null ? Home.fromJson(json['home']) : null;
//     officialArtwork = json['official-artwork'] != null
//         ? OfficialArtwork.fromJson(json['official-artwork'])
//         : null;
//     showdown =
//         json['showdown'] != null ? Showdown.fromJson(json['showdown']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (dreamWorld != null) {
//       data['dream_world'] = dreamWorld!.toJson();
//     }
//     if (home != null) {
//       data['home'] = home!.toJson();
//     }
//     if (officialArtwork != null) {
//       data['official-artwork'] = officialArtwork!.toJson();
//     }
//     if (showdown != null) {
//       data['showdown'] = showdown!.toJson();
//     }
//     return data;
//   }
// }

// class DreamWorld {
//   String? frontDefault;
//   String? frontFemale;

//   DreamWorld({this.frontDefault, this.frontFemale});

//   DreamWorld.fromJson(Map<String, dynamic> json) {
//     frontDefault = json['front_default'];
//     frontFemale = json['front_female'] ?? "";
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['front_default'] = frontDefault;
//     data['front_female'] = frontFemale;
//     return data;
//   }
// }

// class Home {
//   String? frontDefault;
//   String? frontFemale;
//   String? frontShiny;
//   String? frontShinyFemale;

//   Home(
//       {this.frontDefault,
//       this.frontFemale,
//       this.frontShiny,
//       this.frontShinyFemale});

//   Home.fromJson(Map<String, dynamic> json) {
//     frontDefault = json['front_default'];
//     frontFemale = json['front_female'];
//     frontShiny = json['front_shiny'];
//     frontShinyFemale = json['front_shiny_female'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['front_default'] = frontDefault;
//     data['front_female'] = frontFemale;
//     data['front_shiny'] = frontShiny;
//     data['front_shiny_female'] = frontShinyFemale;
//     return data;
//   }
// }

// class OfficialArtwork {
//   String? frontDefault;
//   String? frontShiny;

//   OfficialArtwork({this.frontDefault, this.frontShiny});

//   OfficialArtwork.fromJson(Map<String, dynamic> json) {
//     frontDefault = json['front_default'];
//     frontShiny = json['front_shiny'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['front_default'] = frontDefault;
//     data['front_shiny'] = frontShiny;
//     return data;
//   }
// }

// class Showdown {
//   String? backDefault;
//   String? backFemale;
//   String? backShiny;
//   String? backShinyFemale;
//   String? frontDefault;
//   String? frontFemale;
//   String? frontShiny;
//   String? frontShinyFemale;

//   Showdown(
//       {this.backDefault,
//       this.backFemale,
//       this.backShiny,
//       this.backShinyFemale,
//       this.frontDefault,
//       this.frontFemale,
//       this.frontShiny,
//       this.frontShinyFemale});

//   Showdown.fromJson(Map<String, dynamic> json) {
//     backDefault = json['back_default'] ?? "";
//     backFemale = json['back_female'] ?? "";
//     backShiny = json['back_shiny'] ?? "";
//     backShinyFemale = json['back_shiny_female'] ?? "";
//     frontDefault = json['front_default'] ?? "";
//     frontFemale = json['front_female'] ?? "";
//     frontShiny = json['front_shiny'] ?? "";
//     frontShinyFemale = json['front_shiny_female'] ?? "";
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['back_default'] = backDefault;
//     data['back_female'] = backFemale;
//     data['back_shiny'] = backShiny;
//     data['back_shiny_female'] = backShinyFemale;
//     data['front_default'] = frontDefault;
//     data['front_female'] = frontFemale;
//     data['front_shiny'] = frontShiny;
//     data['front_shiny_female'] = frontShinyFemale;
//     return data;
//   }
// }

// class Versions {
//   GenerationI? generationI;
//   GenerationIi? generationIi;
//   GenerationIii? generationIii;
//   GenerationIv? generationIv;
//   GenerationV? generationV;
//   GenerationVi? generationVi;
//   GenerationVii? generationVii;
//   GenerationViii? generationViii;

//   Versions(
//       {this.generationI,
//       this.generationIi,
//       this.generationIii,
//       this.generationIv,
//       this.generationV,
//       this.generationVi,
//       this.generationVii,
//       this.generationViii});

//   Versions.fromJson(Map<String, dynamic> json) {
//     generationI = json['generation-i'] != null
//         ? GenerationI.fromJson(json['generation-i'])
//         : null;
//     generationIi = json['generation-ii'] != null
//         ? GenerationIi.fromJson(json['generation-ii'])
//         : null;
//     generationIii = json['generation-iii'] != null
//         ? GenerationIii.fromJson(json['generation-iii'])
//         : null;
//     generationIv = json['generation-iv'] != null
//         ? GenerationIv.fromJson(json['generation-iv'])
//         : null;
//     generationV = json['generation-v'] != null
//         ? GenerationV.fromJson(json['generation-v'])
//         : null;
//     generationVi = json['generation-vi'] != null
//         ? GenerationVi.fromJson(json['generation-vi'])
//         : null;
//     generationVii = json['generation-vii'] != null
//         ? GenerationVii.fromJson(json['generation-vii'])
//         : null;
//     generationViii = json['generation-viii'] != null
//         ? GenerationViii.fromJson(json['generation-viii'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (generationI != null) {
//       data['generation-i'] = generationI!.toJson();
//     }
//     if (generationIi != null) {
//       data['generation-ii'] = generationIi!.toJson();
//     }
//     if (generationIii != null) {
//       data['generation-iii'] = generationIii!.toJson();
//     }
//     if (generationIv != null) {
//       data['generation-iv'] = generationIv!.toJson();
//     }
//     if (generationV != null) {
//       data['generation-v'] = generationV!.toJson();
//     }
//     if (generationVi != null) {
//       data['generation-vi'] = generationVi!.toJson();
//     }
//     if (generationVii != null) {
//       data['generation-vii'] = generationVii!.toJson();
//     }
//     if (generationViii != null) {
//       data['generation-viii'] = generationViii!.toJson();
//     }
//     return data;
//   }
// }

// class GenerationI {
//   RedBlue? redBlue;
//   RedBlue? yellow;

//   GenerationI({this.redBlue, this.yellow});

//   GenerationI.fromJson(Map<String, dynamic> json) {
//     redBlue =
//         json['red-blue'] != null ? RedBlue.fromJson(json['red-blue']) : null;
//     yellow = json['yellow'] != null ? RedBlue.fromJson(json['yellow']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (redBlue != null) {
//       data['red-blue'] = redBlue!.toJson();
//     }
//     if (yellow != null) {
//       data['yellow'] = yellow!.toJson();
//     }
//     return data;
//   }
// }

// class RedBlue {
//   String? backDefault;
//   String? backGray;
//   String? backTransparent;
//   String? frontDefault;
//   String? frontGray;
//   String? frontTransparent;

//   RedBlue(
//       {this.backDefault,
//       this.backGray,
//       this.backTransparent,
//       this.frontDefault,
//       this.frontGray,
//       this.frontTransparent});

//   RedBlue.fromJson(Map<String, dynamic> json) {
//     backDefault = json['back_default'] ?? "";
//     backGray = json['back_gray'] ?? "";
//     backTransparent = json['back_transparent'] ?? "";
//     frontDefault = json['front_default'] ?? "";
//     frontGray = json['front_gray'] ?? "";
//     frontTransparent = json['front_transparent'] ?? "";
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['back_default'] = backDefault;
//     data['back_gray'] = backGray;
//     data['back_transparent'] = backTransparent;
//     data['front_default'] = frontDefault;
//     data['front_gray'] = frontGray;
//     data['front_transparent'] = frontTransparent;
//     return data;
//   }
// }

// class GenerationIi {
//   Crystal? crystal;
//   Gold? gold;
//   Gold? silver;

//   GenerationIi({this.crystal, this.gold, this.silver});

//   GenerationIi.fromJson(Map<String, dynamic> json) {
//     crystal =
//         json['crystal'] != null ? Crystal.fromJson(json['crystal']) : null;
//     gold = json['gold'] != null ? Gold.fromJson(json['gold']) : null;
//     silver = json['silver'] != null ? Gold.fromJson(json['silver']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (crystal != null) {
//       data['crystal'] = crystal!.toJson();
//     }
//     if (gold != null) {
//       data['gold'] = gold!.toJson();
//     }
//     if (silver != null) {
//       data['silver'] = silver!.toJson();
//     }
//     return data;
//   }
// }

// class Crystal {
//   String? backDefault;
//   String? backShiny;
//   String? backShinyTransparent;
//   String? backTransparent;
//   String? frontDefault;
//   String? frontShiny;
//   String? frontShinyTransparent;
//   String? frontTransparent;

//   Crystal(
//       {this.backDefault,
//       this.backShiny,
//       this.backShinyTransparent,
//       this.backTransparent,
//       this.frontDefault,
//       this.frontShiny,
//       this.frontShinyTransparent,
//       this.frontTransparent});

//   Crystal.fromJson(Map<String, dynamic> json) {
//     backDefault = json['back_default'] ?? "";
//     backShiny = json['back_shiny'] ?? "";
//     backShinyTransparent = json['back_shiny_transparent'] ?? "";
//     backTransparent = json['back_transparent'] ?? "";
//     frontDefault = json['front_default'] ?? "";
//     frontShiny = json['front_shiny'] ?? "";
//     frontShinyTransparent = json['front_shiny_transparent'] ?? "";
//     frontTransparent = json['front_transparent'] ?? "";
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['back_default'] = backDefault;
//     data['back_shiny'] = backShiny;
//     data['back_shiny_transparent'] = backShinyTransparent;
//     data['back_transparent'] = backTransparent;
//     data['front_default'] = frontDefault;
//     data['front_shiny'] = frontShiny;
//     data['front_shiny_transparent'] = frontShinyTransparent;
//     data['front_transparent'] = frontTransparent;
//     return data;
//   }
// }

// class Gold {
//   String? backDefault;
//   String? backShiny;
//   String? frontDefault;
//   String? frontShiny;
//   String? frontTransparent;

//   Gold(
//       {this.backDefault,
//       this.backShiny,
//       this.frontDefault,
//       this.frontShiny,
//       this.frontTransparent});

//   Gold.fromJson(Map<String, dynamic> json) {
//     backDefault = json['back_default'] ?? "";
//     backShiny = json['back_shiny'] ?? "";
//     frontDefault = json['front_default'] ?? "";
//     frontShiny = json['front_shiny'] ?? "";
//     frontTransparent = json['front_transparent'] ?? "";
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['back_default'] = backDefault;
//     data['back_shiny'] = backShiny;
//     data['front_default'] = frontDefault;
//     data['front_shiny'] = frontShiny;
//     data['front_transparent'] = frontTransparent;
//     return data;
//   }
// }

// class GenerationIii {
//   OfficialArtwork? emerald;
//   FireredLeafgreen? fireredLeafgreen;
//   FireredLeafgreen? rubySapphire;

//   GenerationIii({this.emerald, this.fireredLeafgreen, this.rubySapphire});

//   GenerationIii.fromJson(Map<String, dynamic> json) {
//     emerald = json['emerald'] != null
//         ? OfficialArtwork.fromJson(json['emerald'])
//         : null;
//     fireredLeafgreen = json['firered-leafgreen'] != null
//         ? FireredLeafgreen.fromJson(json['firered-leafgreen'])
//         : null;
//     rubySapphire = json['ruby-sapphire'] != null
//         ? FireredLeafgreen.fromJson(json['ruby-sapphire'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (emerald != null) {
//       data['emerald'] = emerald!.toJson();
//     }
//     if (fireredLeafgreen != null) {
//       data['firered-leafgreen'] = fireredLeafgreen!.toJson();
//     }
//     if (rubySapphire != null) {
//       data['ruby-sapphire'] = rubySapphire!.toJson();
//     }
//     return data;
//   }
// }

// class FireredLeafgreen {
//   String? backDefault;
//   String? backShiny;
//   String? frontDefault;
//   String? frontShiny;

//   FireredLeafgreen(
//       {this.backDefault, this.backShiny, this.frontDefault, this.frontShiny});

//   FireredLeafgreen.fromJson(Map<String, dynamic> json) {
//     backDefault = json['back_default'];
//     backShiny = json['back_shiny'];
//     frontDefault = json['front_default'];
//     frontShiny = json['front_shiny'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['back_default'] = backDefault;
//     data['back_shiny'] = backShiny;
//     data['front_default'] = frontDefault;
//     data['front_shiny'] = frontShiny;
//     return data;
//   }
// }

// class GenerationIv {
//   DiamondPearl? diamondPearl;
//   DiamondPearl? heartgoldSoulsilver;
//   DiamondPearl? platinum;

//   GenerationIv({this.diamondPearl, this.heartgoldSoulsilver, this.platinum});

//   GenerationIv.fromJson(Map<String, dynamic> json) {
//     diamondPearl = json['diamond-pearl'] != null
//         ? DiamondPearl.fromJson(json['diamond-pearl'])
//         : null;
//     heartgoldSoulsilver = json['heartgold-soulsilver'] != null
//         ? DiamondPearl.fromJson(json['heartgold-soulsilver'])
//         : null;
//     platinum = json['platinum'] != null
//         ? DiamondPearl.fromJson(json['platinum'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (diamondPearl != null) {
//       data['diamond-pearl'] = diamondPearl!.toJson();
//     }
//     if (heartgoldSoulsilver != null) {
//       data['heartgold-soulsilver'] = heartgoldSoulsilver!.toJson();
//     }
//     if (platinum != null) {
//       data['platinum'] = platinum!.toJson();
//     }
//     return data;
//   }
// }

// class DiamondPearl {
//   String? backDefault;
//   String? backFemale;
//   String? backShiny;
//   String? backShinyFemale;
//   String? frontDefault;
//   String? frontFemale;
//   String? frontShiny;
//   String? frontShinyFemale;

//   DiamondPearl(
//       {this.backDefault,
//       this.backFemale,
//       this.backShiny,
//       this.backShinyFemale,
//       this.frontDefault,
//       this.frontFemale,
//       this.frontShiny,
//       this.frontShinyFemale});

//   DiamondPearl.fromJson(Map<String, dynamic> json) {
//     backDefault = json['back_default'];
//     backFemale = json['back_female'];
//     backShiny = json['back_shiny'];
//     backShinyFemale = json['back_shiny_female'];
//     frontDefault = json['front_default'];
//     frontFemale = json['front_female'];
//     frontShiny = json['front_shiny'];
//     frontShinyFemale = json['front_shiny_female'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['back_default'] = backDefault;
//     data['back_female'] = backFemale;
//     data['back_shiny'] = backShiny;
//     data['back_shiny_female'] = backShinyFemale;
//     data['front_default'] = frontDefault;
//     data['front_female'] = frontFemale;
//     data['front_shiny'] = frontShiny;
//     data['front_shiny_female'] = frontShinyFemale;
//     return data;
//   }
// }

// class GenerationV {
//   BlackWhite? blackWhite;

//   GenerationV({this.blackWhite});

//   GenerationV.fromJson(Map<String, dynamic> json) {
//     blackWhite = json['black-white'] != null
//         ? BlackWhite.fromJson(json['black-white'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (blackWhite != null) {
//       data['black-white'] = blackWhite!.toJson();
//     }
//     return data;
//   }
// }

// class BlackWhite {
//   DiamondPearl? animated;
//   String? backDefault;
//   String? backFemale;
//   String? backShiny;
//   String? backShinyFemale;
//   String? frontDefault;
//   String? frontFemale;
//   String? frontShiny;
//   String? frontShinyFemale;

//   BlackWhite(
//       {this.animated,
//       this.backDefault,
//       this.backFemale,
//       this.backShiny,
//       this.backShinyFemale,
//       this.frontDefault,
//       this.frontFemale,
//       this.frontShiny,
//       this.frontShinyFemale});

//   BlackWhite.fromJson(Map<String, dynamic> json) {
//     animated = json['animated'] != null
//         ? DiamondPearl.fromJson(json['animated'])
//         : null;
//     backDefault = json['back_default'];
//     backFemale = json['back_female'];
//     backShiny = json['back_shiny'];
//     backShinyFemale = json['back_shiny_female'];
//     frontDefault = json['front_default'];
//     frontFemale = json['front_female'];
//     frontShiny = json['front_shiny'];
//     frontShinyFemale = json['front_shiny_female'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (animated != null) {
//       data['animated'] = animated!.toJson();
//     }
//     data['back_default'] = backDefault;
//     data['back_female'] = backFemale;
//     data['back_shiny'] = backShiny;
//     data['back_shiny_female'] = backShinyFemale;
//     data['front_default'] = frontDefault;
//     data['front_female'] = frontFemale;
//     data['front_shiny'] = frontShiny;
//     data['front_shiny_female'] = frontShinyFemale;
//     return data;
//   }
// }

// class GenerationVi {
//   Home? omegarubyAlphasapphire;
//   Home? xY;

//   GenerationVi({this.omegarubyAlphasapphire, this.xY});

//   GenerationVi.fromJson(Map<String, dynamic> json) {
//     omegarubyAlphasapphire = json['omegaruby-alphasapphire'] != null
//         ? Home.fromJson(json['omegaruby-alphasapphire'])
//         : null;
//     xY = json['x-y'] != null ? Home.fromJson(json['x-y']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (omegarubyAlphasapphire != null) {
//       data['omegaruby-alphasapphire'] = omegarubyAlphasapphire!.toJson();
//     }
//     if (xY != null) {
//       data['x-y'] = xY!.toJson();
//     }
//     return data;
//   }
// }

// class GenerationVii {
//   DreamWorld? icons;
//   Home? ultraSunUltraMoon;

//   GenerationVii({this.icons, this.ultraSunUltraMoon});

//   GenerationVii.fromJson(Map<String, dynamic> json) {
//     icons = json['icons'] != null ? DreamWorld.fromJson(json['icons']) : null;
//     ultraSunUltraMoon = json['ultra-sun-ultra-moon'] != null
//         ? Home.fromJson(json['ultra-sun-ultra-moon'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (icons != null) {
//       data['icons'] = icons!.toJson();
//     }
//     if (ultraSunUltraMoon != null) {
//       data['ultra-sun-ultra-moon'] = ultraSunUltraMoon!.toJson();
//     }
//     return data;
//   }
// }

// class GenerationViii {
//   DreamWorld? icons;

//   GenerationViii({this.icons});

//   GenerationViii.fromJson(Map<String, dynamic> json) {
//     icons = json['icons'] != null ? DreamWorld.fromJson(json['icons']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (icons != null) {
//       data['icons'] = icons!.toJson();
//     }
//     return data;
//   }
// }

// class Icons {
//   String? frontDefault;
//   String? frontFemale;

//   Icons({this.frontDefault, this.frontFemale});

//   Icons.fromJson(Map<String, dynamic> json) {
//     frontDefault = json['front_default'];
//     frontFemale = json['front_female'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['front_default'] = frontDefault;
//     data['front_female'] = frontFemale;
//     return data;
//   }
// }

// class Stats {
//   int? baseStat;
//   int? effort;
//   Ability? stat;

//   Stats({this.baseStat, this.effort, this.stat});

//   Stats.fromJson(Map<String, dynamic> json) {
//     baseStat = json['base_stat'];
//     effort = json['effort'];
//     stat = json['stat'] != null ? Ability.fromJson(json['stat']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['base_stat'] = baseStat;
//     data['effort'] = effort;
//     if (stat != null) {
//       data['stat'] = stat!.toJson();
//     }
//     return data;
//   }
// }

// class Types {
//   int? slot;
//   Ability? type;

//   Types({this.slot, this.type});

//   Types.fromJson(Map<String, dynamic> json) {
//     slot = json['slot'];
//     type = json['type'] != null ? Ability.fromJson(json['type']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['slot'] = slot;
//     if (type != null) {
//       data['type'] = type!.toJson();
//     }
//     return data;
//   }
// }
