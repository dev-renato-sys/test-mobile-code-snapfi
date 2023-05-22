import 'package:dartz/dartz.dart';
import 'package:snapfi_app/modules/snapfi_app/data/repositories/pokemon_repository_implementation.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/models/pokemon_detail.dart';
import '../errors/errors.dart';

class GetPokemonUsecase {
  final PokemonRepositoryImplementation pokemonRepositoryImplementation;
  GetPokemonUsecase({required this.pokemonRepositoryImplementation});
  Future<Either<FailGetPokemon, PokemonDetail>> call(
      {String? name, String? id}) async {
    return pokemonRepositoryImplementation.pokemon(
        name: name, id: id);
  }
}
