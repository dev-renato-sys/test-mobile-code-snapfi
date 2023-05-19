import 'package:flutter/material.dart';
import 'package:snapfi_app/helpers/hex_color.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/entities/pokemon_detail_dto.dart';

class PokemonDetailSkeleton extends StatelessWidget {
  final PokemonDetail pokemonDetail;
  final Widget child;
  const PokemonDetailSkeleton(
      {super.key, required this.pokemonDetail, required this.child});

  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          color: pokemonDetail.types![0].type!.getColorBasedOnAbility(),
          height: phoneHeight,
          width: phoneWidth,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              'assets/images/pokebola.png',
              width: 250,
              color: HexColor.createMaterialColor(
                  pokemonDetail.types![0].type!.getColorBasedOnAbility())[400],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: child,
        )
      ],
    );
  }
}
