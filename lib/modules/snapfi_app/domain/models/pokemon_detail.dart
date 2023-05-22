// ignore_for_file: prefer_void_to_null, unnecessary_question_mark

import 'package:snapfi_app/modules/snapfi_app/domain/models/pokemon_detail/abilities.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/models/pokemon_detail/ability.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/models/pokemon_detail/game_indices.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/models/pokemon_detail/moves.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/models/pokemon_detail/sprites.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/models/pokemon_detail/stats.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/models/pokemon_detail/types.dart';

class PokemonDetail {
  List<Abilities>? abilities;
  int? baseExperience;
  List<GameIndices>? gameIndices;
  int? height;
  List<void>? heldItems;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  List<Moves>? moves;
  String? name;
  int? order;
  List<void>? pastTypes;
  Ability? species;
  Sprites? sprites;
  List<Stats>? stats;
  List<Types>? types;
  int? weight;

  PokemonDetail(
      {this.abilities,
      this.baseExperience,
      this.gameIndices,
      this.height,
      this.heldItems,
      this.id,
      this.isDefault,
      this.locationAreaEncounters,
      this.moves,
      this.name,
      this.order,
      this.pastTypes,
      this.species,
      this.sprites,
      this.stats,
      this.types,
      this.weight});

  PokemonDetail.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = <Abilities>[];
      json['abilities'].forEach((v) {
        abilities!.add(Abilities.fromJson(v));
      });
    }
    baseExperience = json['base_experience'];
    if (json['game_indices'] != null) {
      gameIndices = <GameIndices>[];
      json['game_indices'].forEach((v) {
        gameIndices!.add(GameIndices.fromJson(v));
      });
    }
    height = json['height'];
    id = json['id'];
    isDefault = json['is_default'];
    locationAreaEncounters = json['location_area_encounters'];
    if (json['moves'] != null) {
      moves = <Moves>[];
      json['moves'].forEach((v) {
        moves!.add(Moves.fromJson(v));
      });
    }
    name = json['name'];
    order = json['order'];
    species =
        json['species'] != null ? Ability.fromJson(json['species']) : null;
    sprites =
        json['sprites'] != null ? Sprites.fromJson(json['sprites']) : null;
    if (json['stats'] != null) {
      stats = <Stats>[];
      json['stats'].forEach((v) {
        stats!.add(Stats.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (abilities != null) {
      data['abilities'] = abilities!.map((v) => v.toJson()).toList();
    }
    data['base_experience'] = baseExperience;
    if (gameIndices != null) {
      data['game_indices'] = gameIndices!.map((v) => v.toJson()).toList();
    }
    data['height'] = height;
    data['id'] = id;
    data['is_default'] = isDefault;
    data['location_area_encounters'] = locationAreaEncounters;
    if (moves != null) {
      data['moves'] = moves!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['order'] = order;
    if (species != null) {
      data['species'] = species!.toJson();
    }
    if (sprites != null) {
      data['sprites'] = sprites!.toJson();
    }
    if (stats != null) {
      data['stats'] = stats!.map((v) => v.toJson()).toList();
    }
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    data['weight'] = weight;
    return data;
  }

  double getDoubleHeight() {
    return height! / 10;
  }

  double getDoubleWeight() {
    return weight! / 10;
  }
}
