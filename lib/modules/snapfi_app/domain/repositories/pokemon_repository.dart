import 'package:dartz/dartz.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/entities/pokemon_detail_dto.dart';

import '../entities/pokemons_dto.dart';
import '../errors/errors.dart';

abstract class PokemonRepository {
  Future<Either<FailGetPokemon, List<Pokemon>>> pokemons({ int? limit });

  Future<Either<FailGetPokemon, PokemonDetail>> pokemon({ String? name, String? id });
}
