import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:snapfi_app/modules/snapfi_app/data/models/pokemon_response_model.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/entities/pokemon_detail_dto.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/entities/pokemons_dto.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/errors/errors.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/repositories/pokemon_repository.dart';

import '../datasources/pokemon_datasource_test.mocks.dart';
import 'pokemon_repositoy_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PokemonRepository>()])
Future<void> main() async {
  final MockPokemonDatasource mockPokemonDatasource = MockPokemonDatasource();
  final MockPokemonRepository mockPokemonRepository = MockPokemonRepository();

  group(
      'check if pokemons response is received succesfully and tranformed into dto/model',
      () {
    test('test model [PokemonResponseModel]', () async {
      when(mockPokemonDatasource.pokemons()).thenAnswer((_) async {
        return Dio().get('https://pokeapi.co/api/v2/pokemon');
      });

      when(mockPokemonRepository.pokemons()).thenAnswer((_) async {
        try {
          Response res = await mockPokemonDatasource.pokemons();

          PokemonResponseModel pokemonResponseModel =
              PokemonResponseModel.fromJson(res.data);

          return Right(pokemonResponseModel.results!);
        } catch (e) {
          return Left(FailGetPokemon(message: ''));
        }
      });

      Either<FailGetPokemon, List<Pokemon>> res =
          await mockPokemonRepository.pokemons();

      expect(res, isA<Right>());
    });

    test('test dto [PokemonDetail]', () async {
      when(mockPokemonDatasource.pokemon()).thenAnswer((_) async {
        return Dio().get('https://pokeapi.co/api/v2/pokemon');
      });

      when(mockPokemonRepository.pokemon()).thenAnswer((_) async {
        try {
          Response res = await mockPokemonDatasource.pokemon();

          PokemonDetail pokemonResponseModel = PokemonDetail.fromJson(res.data);

          return Right(pokemonResponseModel);
        } catch (e) {
          return Left(FailGetPokemon(message: ''));
        }
      });

      Either<FailGetPokemon, List<Pokemon>> res =
          await mockPokemonRepository.pokemons();

      expect(res, isA<Left>());
    });
  });
}
