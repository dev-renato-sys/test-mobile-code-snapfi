import 'package:flutter/material.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/models/pokemon_detail.dart';

class PokemonType extends StatelessWidget {
  final PokemonDetail pokemonDetail;
  const PokemonType({super.key, required this.pokemonDetail});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ...pokemonDetail.types!.map(
        (Types e) {
          return Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: e.type!.getColorBasedOnAbility(),
                    borderRadius: BorderRadius.circular(20)),
                // color: Colors.green,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    e.type?.getNameUpperCaseFirstLetter() ?? 'Houve um erro',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ),
              if (pokemonDetail.types!.indexOf(e) == 0 &&
                  pokemonDetail.types!.length > 1)
                const SizedBox(
                  width: 10.0,
                )
            ],
          );
        },
      )
    ]);
  }
}
