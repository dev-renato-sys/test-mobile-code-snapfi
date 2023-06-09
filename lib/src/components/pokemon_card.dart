import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/models/pokemon.dart';
import 'package:snapfi_app/src/bloc/pokemon/bloc.dart';
import 'package:snapfi_app/src/components/pokemon_image.dart';
import 'package:snapfi_app/src/pages/pokemon_detail/pokemon_detail_page.dart';
import '../../injection_container.dart' as ic;

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final List<Pokemon> listPokemon;
  const PokemonCard(
      {super.key, required this.pokemon, required this.listPokemon});

  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;

    double phoneHeight = MediaQuery.of(context).size.height;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider<PokemonBloc>(
                      create: ((context) => ic.sl<PokemonBloc>()),
                      child: PokemonDetailPage(
                        pokemonList: listPokemon,
                        index: listPokemon.indexOf(pokemon),
                      ),
                    )),
          );
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Spacer(),
                  Text(
                    pokemon.getIdWithHashtag(),
                    style: TextStyle(color: Colors.grey[600], fontSize: 9.0),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                height: phoneWidth > phoneHeight
                    ? phoneHeight / 4
                    : phoneHeight / 20,
                width: double.infinity,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    pokemon.getNameUpperCaseFirstLetter(),
                  ),
                )),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Align(
                  alignment: Alignment.center,
                  child: PokemonImage(
                    imgUrl: dotenv.env["IMG_URL"]!,
                    pokemon: pokemon,
                    height: phoneWidth > phoneHeight ? 100 : phoneWidth / 6,
                    width: phoneWidth > phoneHeight ? 100 : 70,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
