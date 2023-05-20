import 'package:dio/dio.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/http_helper.dart';

import '../../data/datasources/pokemon_datasource.dart';

class PokemonApiDataSource implements PokemonDatasource {
  final Dio dio;
  final String baseUrl = 'https://pokeapi.co/api/v2/';
  late HttpHelper httpHelper = HttpHelper(url: '');

  PokemonApiDataSource({required this.dio});

  @override
  Future<HttpHelper> pokemons({int? limit = 20}) async {
    String apiPath = 'pokemon?limit=$limit';

    httpHelper.url = '$baseUrl$apiPath';

    HttpHelper response = await httpHelper.get();

    return response;
  }

  @override
  Future<HttpHelper> pokemon({String? filter}) async {
    String apiPath = 'pokemon/$filter';

    httpHelper.url = '$baseUrl$apiPath';

    HttpHelper response = await httpHelper.get();

    return response;
  }
}
