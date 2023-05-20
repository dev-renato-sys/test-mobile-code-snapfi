import 'package:dartz/dartz.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/entities/pokemon_detail_dto.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/http_helper.dart';
import '../../domain/entities/pokemon_response_dto.dart';
import '../../domain/entities/pokemons_dto.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../../external/datasource/pokemon_implementation.dart';
import '../models/pokemon_response_model.dart';

class PokemonRepositoryImplementation extends PokemonRepository {
  final PokemonApiDataSource pokemonApiDataSource;

  PokemonRepositoryImplementation({required this.pokemonApiDataSource});

  @override
  Future<Either<FailGetPokemon, List<Pokemon>>> pokemons({int? limit}) async {
    HttpHelper httpHelper = await pokemonApiDataSource.pokemons(limit: limit);

    if (httpHelper.hasExcepion()) {
      ExceptionsInfos exceptionsInfos = httpHelper.getExceptionMessage();

      return Left(FailGetPokemon(
          message: exceptionsInfos.message,
          statusCode: exceptionsInfos.statusCode));
    }

    PokemonResponseDto pokemonsList =
        PokemonResponseModel.fromJson(httpHelper.getData());

    return Right(pokemonsList.results!);
  }

  @override
  Future<Either<FailGetPokemon, PokemonDetail>> pokemon(
      {String? name, String? id}) async {
    String filter = name ?? id ?? '';

    HttpHelper httpHelper = await pokemonApiDataSource.pokemon(filter: filter);

    if (httpHelper.hasExcepion()) {
      ExceptionsInfos exceptionsInfos = httpHelper.getExceptionMessage();

      return Left(FailGetPokemon(
          message: exceptionsInfos.message,
          statusCode: exceptionsInfos.statusCode));
    }

    PokemonDetail pokemonDetail = PokemonDetail.fromJson(httpHelper.getData());

    return Right(pokemonDetail);
  }
}
