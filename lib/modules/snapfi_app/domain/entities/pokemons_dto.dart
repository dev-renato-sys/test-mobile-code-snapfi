import 'package:flutter/material.dart';

class Pokemon {
  String? name;
  String? url;

  Pokemon({this.name, this.url});

  int getId() {
    return int.parse(url!.split('pokemon/').last.replaceAll('/', ''));
  }

  Widget getPokemonImage(
      {double? width = 40, double? height = 50, double scale = 1.0}) {
    return Image.network(
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${int.parse(url!.split('pokemon/').last.replaceAll('/', ''))}.png',
      width: width,
      height: height,
      fit: BoxFit.fill,
      // loadingBuilder: (context, child, loadingProgress) {
      //   return Icon(
      //     Icons.error,
      //     color: primaryColor,
      //   );
      // },
    );
  }

  String getNameUpperCaseFirstLetter() {
    return '${name?.substring(0, 1).toUpperCase()}${name!.substring(1, name!.length)}';
  }

  String getIdWithHashtag() {
    String valueWithHashtag =
        '${int.parse(url!.split('pokemon/').last.replaceAll('/', ''))}'
            .padLeft(3, '0');
    return '#$valueWithHashtag';
  }
}
