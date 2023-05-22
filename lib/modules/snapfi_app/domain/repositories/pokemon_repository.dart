import 'package:dartz/dartz.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/models/pokemon_detail.dart';

import '../models/pokemons.dart';
import '../errors/errors.dart';

abstract class PokemonRepository {
  Future<Either<FailGetPokemon, List<Pokemon>>> pokemons({ int? limit });

  Future<Either<FailGetPokemon, PokemonDetail>> pokemon({ String? name, String? id });
}
