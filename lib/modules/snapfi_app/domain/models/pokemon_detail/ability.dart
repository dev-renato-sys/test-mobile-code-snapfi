import 'package:flutter/material.dart';
import 'package:snapfi_app/helpers/hex_color.dart';

class Ability {
  String? name;
  String? url;

  Ability({this.name, this.url});

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }

  Color getColorBasedOnAbility() {
    final Map<String, Color> abilityColors = {
      'grass': HexColor.fromHex('#74CB48'),
      'bug': HexColor.fromHex('#A7B723'),
      'dark': HexColor.fromHex('#75574C'),
      'dragon': HexColor.fromHex('#7037FF'),
      'electric': HexColor.fromHex('#F9CF30'),
      'fairy': HexColor.fromHex('#E69EAC'),
      'fighting': HexColor.fromHex('#C12239'),
      'fire': HexColor.fromHex('#F57D31'),
      'flying': HexColor.fromHex('#A891EC'),
      'poison': HexColor.fromHex('#A43E9E'),
      'water': HexColor.fromHex('#6493EB'),
      'normal': HexColor.fromHex('#AAA67F'),
      'ground': HexColor.fromHex('#DEC16B'),
      'ice': HexColor.fromHex('#9AD6DF'),
      'psychic': HexColor.fromHex('#FB5584'),
      'rock': HexColor.fromHex('#B69E31'),
      'steel': HexColor.fromHex('#B7B9D0'),
      'ghost': HexColor.fromHex('#70559B'),
    };

    return abilityColors[name] ?? Colors.black;
  }

  String getNameUpperCaseFirstLetter() {
    return '${name?.substring(0, 1).toUpperCase()}${name!.substring(1, name!.length)}';
  }

  String getCorrectNameBasedOnNaming() {
    final Map<String, String> correctName = {
      'hp': 'hp',
      'attack': 'atk',
      'defense': 'def',
      'special-attack': 'satk',
      'special-defense': 'sdef',
      'speed': 'spd',
    };

    return correctName[name] ?? '';
  }
}