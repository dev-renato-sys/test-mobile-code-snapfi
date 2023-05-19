import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/entities/pokemon_detail_dto.dart';

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
  Future<Either<FailGetPokemon, List<Pokemon>>> pokemons({ int? limit }) async {
    try {
      Response response = await pokemonApiDataSource.pokemons(limit: limit);

      PokemonResponseDto pokemonsList =
          PokemonResponseModel.fromJson(response.data);

      return Right(pokemonsList.results!);
    } catch (e) {
      return Left(FailGetPokemon(message: 'Houve um erro'));
    }
  }

  @override
  Future<Either<FailGetPokemon, PokemonDetail>> pokemon(
      {String? name, String? id}) async {
    try {
      String filter = name ?? id ?? '';

      Response response = await pokemonApiDataSource.pokemon(filter: filter);

      PokemonDetail pokemonDetail = PokemonDetail.fromJson(response.data);

      return Right(pokemonDetail);
    } on DioError catch (e) {
      return Left(FailGetPokemon(
          message: 'Houve um erro na pesquisa do pokemon..',
          statusCode: e.response?.statusCode));
    } catch (e) {
      return Left(
          FailGetPokemon(message: 'Houve um erro na pesquisa do pokemon..'));
    }
  }
}
