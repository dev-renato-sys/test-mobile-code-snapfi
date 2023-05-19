import 'package:dio/dio.dart';

abstract class PokemonDatasource {
  Future<Response> pokemons({ int? limit });

  Future<Response> pokemon({ String? filter });
}
