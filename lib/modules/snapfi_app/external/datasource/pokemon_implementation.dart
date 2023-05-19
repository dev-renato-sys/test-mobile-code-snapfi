import 'package:dio/dio.dart';

import '../../data/datasources/pokemon_datasource.dart';

class PokemonApiDataSource implements PokemonDatasource {
  final Dio dio;

  PokemonApiDataSource({required this.dio});

  @override
  Future<Response> pokemons({ int? limit = 20 }) async {
    return dio.get('https://pokeapi.co/api/v2/pokemon?limit=$limit');
  }

  @override
  Future<Response> pokemon({String? filter}) {
    return dio.get('https://pokeapi.co/api/v2/pokemon/$filter');
  }
}
