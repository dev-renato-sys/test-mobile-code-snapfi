import 'package:dartz/dartz.dart';
import 'package:snapfi_app/modules/snapfi_app/data/repositories/pokemon_repository_implementation.dart';
import '../models/pokemons.dart';
import '../errors/errors.dart';

class GetPokemonsUsecase {
  final PokemonRepositoryImplementation pokemonRepositoryImplementation;
  GetPokemonsUsecase({required this.pokemonRepositoryImplementation});
  Future<Either<FailGetPokemon, List<Pokemon>>> call({ int? limit }) async {
    return pokemonRepositoryImplementation.pokemons(limit: limit);
  }
}
