import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/entities/pokemon_detail_dto.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/entities/pokemons_dto.dart';
import 'package:snapfi_app/src/bloc/pokemon/bloc.dart';
import 'package:snapfi_app/src/bloc/pokemon/event.dart';
import 'package:snapfi_app/src/bloc/pokemon/state.dart';
import 'package:snapfi_app/src/components/pokemon_about.dart';
import 'package:snapfi_app/src/components/pokemon_base_stats.dart';
import 'package:snapfi_app/src/components/pokemon_detail_skeleton.dart';
import 'package:snapfi_app/src/components/pokemon_type.dart';
import 'package:snapfi_app/src/theme/light.dart';

class PokemonDetailPage extends StatefulWidget {
  final List<Pokemon> pokemonList;
  final int index;
  const PokemonDetailPage(
      {super.key, required this.pokemonList, required this.index});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  late int _index = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _index = widget.index;
    });
  }

  onPressNextPokemon({required PokemonBloc pokemonBloc}) {
    pokemonBloc.add(
        GetPokemonDetails(idPokemon: widget.pokemonList[_index + 1].getId()));
    setState(() {
      _index = _index + 1;
    });
  }

  onPressPreviousPokemon({required PokemonBloc pokemonBloc}) {
    pokemonBloc.add(
        GetPokemonDetails(idPokemon: widget.pokemonList[_index - 1].getId()));
    setState(() {
      _index = _index - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final PokemonBloc pokemonBloc = BlocProvider.of<PokemonBloc>(context);
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: BlocBuilder<PokemonBloc, PokemonState>(
            bloc: pokemonBloc
              ..add(GetPokemonDetails(
                  idPokemon: widget.pokemonList[_index].getId())),
            builder: (context, state) {
              switch (state.runtimeType) {
                case PokemonLoadingState:
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(color: primaryColor),
                    ),
                  );
                case PokemonErrorState:
                  return Scaffold(
                    body: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/pokebola.png',
                            width: 100,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            'Pokemon não encontrado.',
                          ),
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text(
                                'Voltar',
                                style: TextStyle(color: Colors.black),
                              ))
                        ],
                      ),
                    ),
                  );
                case PokemonDetailState:
                  PokemonDetail pokemonDetail = state.props[0] as PokemonDetail;

                  return PokemonDetailSkeleton(
                      pokemonDetail: pokemonDetail,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    size: 30,
                                  )),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                widget.pokemonList[_index]
                                    .getNameUpperCaseFirstLetter(),
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const Spacer(),
                              Text(
                                widget.pokemonList[_index].getIdWithHashtag(),
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Card(
                                child: SizedBox(
                                  width: phoneWidth,
                                  height: phoneWidth > phoneHeight
                                      ? phoneHeight / 2.7
                                      : phoneHeight / 1.65,
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 60.0,
                                      ),
                                      child: Column(children: [
                                        PokemonType(
                                            pokemonDetail: pokemonDetail),
                                        const SizedBox(
                                          height: 20.0,
                                        ),
                                        PokemonAbout(
                                            pokemonDetail: pokemonDetail),
                                        const SizedBox(
                                          height: 20.0,
                                        ),
                                        PokemonBaseStats(
                                            pokemonDetail: pokemonDetail)
                                      ]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: phoneWidth > phoneHeight ? 0 : 40,
                                  left: 20,
                                  right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (_index != 0)
                                    IconButton(
                                        onPressed: () => onPressPreviousPokemon(
                                            pokemonBloc: pokemonBloc),
                                        icon: const Icon(Icons.arrow_back_ios)),
                                  const Spacer(),
                                  widget.pokemonList[_index]
                                      .getPokemonImage(width: 200, height: 200),
                                  const Spacer(),
                                  if (widget.pokemonList.length - 1 != _index)
                                    IconButton(
                                        onPressed: () => onPressNextPokemon(
                                            pokemonBloc: pokemonBloc),
                                        icon:
                                            const Icon(Icons.arrow_forward_ios))
                                ],
                              ),
                            ),
                          ],
                        ))
                      ]));
                default:
                  return const Text('Not mapped');
              }
            }));
  }
}
