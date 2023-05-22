import 'package:flutter/material.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/models/pokemon.dart';

class PokemonImage extends StatelessWidget {
  final double width;
  final double height;
  final double scale;
  final String imgUrl;
  final Pokemon pokemon;
  const PokemonImage(
      {super.key,
      this.width = 40,
      this.height = 50,
      this.scale = 1,
      required this.imgUrl,
      required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      '$imgUrl${pokemon.getId()}.png',
      width: width,
      height: height,
      fit: BoxFit.fill,
    );
  }
}
