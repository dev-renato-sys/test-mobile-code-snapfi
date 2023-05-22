import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/models/pokemon.dart';
import 'package:snapfi_app/src/theme/light.dart';

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
    return CachedNetworkImage(
      placeholder: (context, url) => Transform.scale(
        scale: 0.2,
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      imageUrl: '$imgUrl${pokemon.getId()}.png',
      width: width,
      height: height,
      fit: BoxFit.fill,
    );
  }
}
