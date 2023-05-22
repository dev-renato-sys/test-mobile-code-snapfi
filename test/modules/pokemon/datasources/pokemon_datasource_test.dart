import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:snapfi_app/modules/snapfi_app/data/datasources/pokemon_datasource.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/http_helper.dart';
import 'pokemon_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PokemonDatasource>()])
Future<void> main() async {
  await dotenv.load(fileName: ".env");
  final MockPokemonDatasource mockPokemonDatasource = MockPokemonDatasource();
  HttpHelper httpHelper = HttpHelper(url: '');
  String baseUrl = dotenv.env['BASE_URL']!;
  group('testing pokemon routes', () {
    test('test get all pokemons route response [200]', () async {
      when(mockPokemonDatasource.pokemons()).thenAnswer((_) async {
        httpHelper.url = '${baseUrl}pokemon';
        return httpHelper.get();
      });
      HttpHelper res = await mockPokemonDatasource.pokemons();
      expect(res.response, isA<Response>());
      expect(res.getStatusCode(), 200);
    });

    test('test limit 1 pokemon pagination, pokemons response[200]', () async {
      when(mockPokemonDatasource.pokemons()).thenAnswer((_) async {
        httpHelper.url = '${baseUrl}pokemon?limit=1';
        return httpHelper.get();
      });
      HttpHelper res = await mockPokemonDatasource.pokemons();
      expect(res.getResponse(), isA<Response>());
      expect(res.getStatusCode(), 200);
    });

    test('test get pokemon by id [1] response[200]', () async {
      when(mockPokemonDatasource.pokemon()).thenAnswer((_) async {
        httpHelper.url = '${baseUrl}pokemon/1';
        return httpHelper.get();
      });
      HttpHelper res = await mockPokemonDatasource.pokemon();
      expect(res.response, isA<Response>());
      expect(res.getStatusCode(), 200);
    });

    test('test get only one pokemon data response by name [charmander] [200]',
        () async {
      when(mockPokemonDatasource.pokemon()).thenAnswer((_) async {
        httpHelper.url = '${baseUrl}pokemon/charmander';
        return httpHelper.get();
      });
      HttpHelper res = await mockPokemonDatasource.pokemon();
      expect(res.response, isA<Response>());
      expect(res.getStatusCode(), 200);
    });
  });
}
