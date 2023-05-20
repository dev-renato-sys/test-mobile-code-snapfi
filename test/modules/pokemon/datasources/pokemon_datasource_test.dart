import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:snapfi_app/modules/snapfi_app/data/datasources/pokemon_datasource.dart';
import 'pokemon_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PokemonDatasource>()])
Future<void> main() async {
  final MockPokemonDatasource mockPokemonDatasource = MockPokemonDatasource();

  group('testing pokemon routes', () {
    
    test('test get all pokemons route response [200]', () async {
      when(mockPokemonDatasource.pokemons()).thenAnswer((_) async {
        return Dio().get('https://pokeapi.co/api/v2/pokemon');
      });
      final res = await mockPokemonDatasource.pokemons();
      expect(res, isA<Response>());
      expect(res.statusCode, 200);
    });

    test('test limit 1 pokemon pagination, pokemons response[200]', () async {
      when(mockPokemonDatasource.pokemons()).thenAnswer((_) async {
        return Dio().get('https://pokeapi.co/api/v2/pokemon?limit=1');
      });
      final res = await mockPokemonDatasource.pokemons();
      expect(res, isA<Response>());
      expect(res.statusCode, 200);
    });

    test('test get only one pokemon data response[200]', () async {
      when(mockPokemonDatasource.pokemon()).thenAnswer((_) async {
        return Dio().get('https://pokeapi.co/api/v2/pokemon/1');
      });
      final res = await mockPokemonDatasource.pokemon();
      expect(res, isA<Response>());
      expect(res.statusCode, 200);
    });

    test(
        'test get only one pokemon data response with filter name [charmander] [200]',
        () async {
      when(mockPokemonDatasource.pokemon()).thenAnswer((_) async {
        return Dio().get('https://pokeapi.co/api/v2/pokemon/charmander');
      });
      final res = await mockPokemonDatasource.pokemon();
      expect(res, isA<Response>());
      expect(res.statusCode, 200);
    });
  });
}
