import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/models/pokemon.dart';
import 'package:snapfi_app/src/bloc/pokemon/bloc.dart';
import 'package:snapfi_app/src/bloc/pokemon/event.dart';
import 'package:snapfi_app/src/bloc/pokemon/state.dart';
import 'package:snapfi_app/src/components/inputs/search_bar.dart';
import 'package:snapfi_app/src/components/loading_pokemons/loading_pokemons.dart';
import 'package:snapfi_app/src/components/pokemon_card.dart';
import 'package:snapfi_app/src/components/pokemon_pokedex_card.dart';
import 'package:snapfi_app/src/pages/pokemon_detail/pokemon_error.dart';
import 'package:snapfi_app/src/theme/light.dart';

class PokemonHomePage extends StatefulWidget {
  const PokemonHomePage({Key? key}) : super(key: key);

  @override
  State<PokemonHomePage> createState() => _LoadHomePageState();
}

class _LoadHomePageState extends State<PokemonHomePage> {
  TextEditingController searchController = TextEditingController();
  ScrollController listPokemonController = ScrollController();
  late int limit = 20;

  @override
  void dispose() {
    listPokemonController.dispose();
    super.dispose();
  }

  onOutsideOfView({required PokemonBloc pokemonBloc}) {
    if (listPokemonController.position.pixels ==
        listPokemonController.position.maxScrollExtent) {
      setState(() {
        limit = limit + 5;
      });

      pokemonBloc.add(PokemonFetchList(limit: limit));
    }
  }

  @override
  Widget build(BuildContext context) {
    final PokemonBloc pokemonBloc = BlocProvider.of<PokemonBloc>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ColoredBox(
              color: primaryColor,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Column(children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          scale: 2,
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Pokedéx',
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: SearchBarApp(
                                searchController: searchController,
                                pokemonBloc: pokemonBloc)),
                        const SizedBox(
                          width: 10.0,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.tag,
                                color: primaryColor,
                              )),
                        )
                      ],
                    )
                  ])),
            ),
            Expanded(
              child: Container(
                color: primaryColor,
                child: BlocBuilder<PokemonBloc, PokemonState>(
                    bloc: pokemonBloc,
                    builder: ((context, state) {
                      switch (state.runtimeType) {
                        case PokemonLoadingState:
                          return const PokemonPokedexSkeleton(
                              child: LoadingPokemons('Loading..'));
                        case PokemonErrorState:
                          return const PokemonErrorComponent(
                            withGoBack: false,
                          );
                        case PokemonLoadedState:
                          List<Pokemon> listPokemon =
                              state.props as List<Pokemon>;
                          return PokemonPokedexSkeleton(
                              child: GridView.count(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 24.0),
                            controller: listPokemonController
                              ..addListener(() =>
                                  onOutsideOfView(pokemonBloc: pokemonBloc)),
                            crossAxisCount: 3,
                            children: [
                              ...listPokemon.map((Pokemon e) => PokemonCard(
                                    listPokemon: listPokemon,
                                    pokemon: e,
                                    // pokemonBloc: pokemonBloc,
                                  ))
                            ],
                          ));
                        default:
                          return const Text('Error not mapped');
                      }
                    })),
              ),
            )
          ],
        ),
      ),
    );
  }
}
