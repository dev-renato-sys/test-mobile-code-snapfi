import 'package:equatable/equatable.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/entities/pokemon_detail_dto.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/entities/pokemons_dto.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();
}

class PokemonLoadingState extends PokemonState {
  final String message;

  const PokemonLoadingState({required this.message});
  @override
  List<Object?> get props => [message];
}

class PokemonErrorState extends PokemonState {
  final String message;

  const PokemonErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class PokemonLoadedState extends PokemonState {
  final List<Pokemon> pokemonList;

  const PokemonLoadedState({required this.pokemonList});

  @override
  List<Object?> get props => pokemonList;
}

class PokemonDetailState extends PokemonState {
  final PokemonDetail pokemonDetail;
  const PokemonDetailState({required this.pokemonDetail});

  @override
  List<Object?> get props => [pokemonDetail];
}
