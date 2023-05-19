import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/entities/pokemons_dto.dart';
import 'package:snapfi_app/src/components/loading_pokemons/loading_pokemons.dart';
import 'package:snapfi_app/src/components/pokemon_card.dart';
import './injection_container.dart' as ic;
import 'src/bloc/pokemon/bloc.dart';
import 'src/bloc/pokemon/event.dart';
import 'src/bloc/pokemon/state.dart';
import 'src/routes/index.dart';
import 'src/theme/dark.dart';
import 'src/theme/light.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ic.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      title: 'Quali APP',
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: '/',
      routes: routes,
      home: BlocProvider<PokemonBloc>(
        create: ((context) => ic.sl<PokemonBloc>()..add(PokemonFetchList())),
        child: LoadHomePage(key: key),
      ),
    );
  }
}

class LoadHomePage extends StatefulWidget {
  const LoadHomePage({Key? key}) : super(key: key);

  @override
  State<LoadHomePage> createState() => _LoadHomePageState();
}

class _LoadHomePageState extends State<LoadHomePage> {
  TextEditingController searchController = TextEditingController();
  ScrollController listPokemonController = ScrollController();
  late int limit = 20;

  @override
  void dispose() {
    listPokemonController.dispose();
    super.dispose();
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
                          width: 10.0,
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
                            child: TextField(
                          style: Theme.of(context).textTheme.bodyMedium,
                          controller: searchController,
                          onSubmitted: (String? value) {
                            pokemonBloc.add(SearchForPokemon(name: value));
                          },
                          decoration: InputDecoration(
                              hintText: 'Search',
                              suffixIcon: IconButton(
                                  onPressed: () => {
                                        pokemonBloc.add(PokemonFetchList()),
                                        searchController.clear()
                                      },
                                  icon: const Icon(Icons.remove_circle)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.0)),
                              prefixIcon: Icon(
                                Icons.search,
                                color: primaryColor,
                              )),
                        )),
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
              child: BlocBuilder<PokemonBloc, PokemonState>(
                  bloc: pokemonBloc,
                  builder: ((context, state) {
                    switch (state.runtimeType) {
                      case PokemonLoadingState:
                        return const LoadingPokemons(
                            'Procurando por pokemons..');
                      case PokemonErrorState:
                        return Center(
                          child: Text(state.props[0].toString()),
                        );
                      case PokemonLoadedState:
                        List<Pokemon> listPokemon =
                            state.props as List<Pokemon>;
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          child: GridView.count(
                            controller: listPokemonController
                              ..addListener(() {
                                if (listPokemonController.position.pixels ==
                                    listPokemonController
                                        .position.maxScrollExtent) {
                                  setState(() {
                                    limit = limit + 5;
                                  });

                                  pokemonBloc
                                      .add(PokemonFetchList(limit: limit));
                                }
                              }),
                            crossAxisCount: 3,
                            children: [
                              ...listPokemon.map((Pokemon e) => PokemonCard(
                                    listPokemon: listPokemon,
                                    pokemon: e,
                                    // pokemonBloc: pokemonBloc,
                                  ))
                            ],
                          ),
                        );
                      default:
                        return const Text('Not mapped');
                    }
                  })),
            )
          ],
        ),
      ),
    );
  }
}
