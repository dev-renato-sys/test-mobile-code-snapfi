import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:snapfi_app/modules/snapfi_app/data/models/pokemon_response_model.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/http_helper.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/entities/pokemon_detail_dto.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/entities/pokemons_dto.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/errors/errors.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/repositories/pokemon_repository.dart';
import '../datasources/pokemon_datasource_test.mocks.dart';
import 'pokemon_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PokemonRepository>()])
Future<void> main() async {
  final MockPokemonDatasource mockPokemonDatasource = MockPokemonDatasource();
  final MockPokemonRepository mockPokemonRepository = MockPokemonRepository();
  late HttpHelper httpHelper = HttpHelper(url: '');
  const String baseUrl = 'https://pokeapi.co/api/v2/';
  group(
      'check if pokemons response is received succesfully and tranformed into dto/model',
      () {
    test('test model and http request [PokemonResponseModel]', () async {
      when(mockPokemonDatasource.pokemons()).thenAnswer((_) async {
        httpHelper.url = '${baseUrl}pokemon';
        return httpHelper.get();
      });

      when(mockPokemonRepository.pokemons()).thenAnswer((_) async {
        HttpHelper res = await mockPokemonDatasource.pokemons();

        if (res.hasExcepion()) {
          return Left(FailGetPokemon(message: ''));
        }

        PokemonResponseModel pokemonResponseModel =
            PokemonResponseModel.fromJson(res.getData());

        return Right(pokemonResponseModel.results!);
      });

      Either<FailGetPokemon, List<Pokemon>> res =
          await mockPokemonRepository.pokemons();

      expect(res, isA<Right>());
    });

    test('test dto and http request [PokemonDetail]', () async {
      when(mockPokemonDatasource.pokemon()).thenAnswer((_) async {
        httpHelper.url = '${baseUrl}pokemon';
        return httpHelper.get();
      });

      when(mockPokemonRepository.pokemon()).thenAnswer((_) async {
        HttpHelper res = await mockPokemonDatasource.pokemon();

        if (res.hasExcepion()) {
          return Left(FailGetPokemon(message: ''));
        }

        PokemonDetail pokemonResponseModel =
            PokemonDetail.fromJson(res.getData());

        return Right(pokemonResponseModel);
      });

      Either<FailGetPokemon, List<Pokemon>> res =
          await mockPokemonRepository.pokemons();

      expect(res, isA<Right>());
    });
  });
}
