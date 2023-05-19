// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:snapfi_app/src/theme/light.dart';

class Pokemon {
  String? name;
  String? url;

  Pokemon({this.name, this.url});

  int getId() {
    return int.parse(url!.split('pokemon/').last.replaceAll('/', ''));
  }

  Widget getPokemonImage(
      {double? width = 40, double? height = 50, double scale = 1.0}) {
    return SvgPicture.network(
      'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/'
      '${int.parse(url!.split('pokemon/').last.replaceAll('/', ''))}.svg',
      width: width,
      height: height,
      fit: BoxFit.fitHeight,
      placeholderBuilder: (BuildContext context) {
        return Icon(
          Icons.error,
          color: primaryColor,
        );
      },
    );
  }

  String getNameUpperCaseFirstLetter() {
    return '${name?.substring(0, 1).toUpperCase()}${name!.substring(1, name!.length)}';
  }
}
