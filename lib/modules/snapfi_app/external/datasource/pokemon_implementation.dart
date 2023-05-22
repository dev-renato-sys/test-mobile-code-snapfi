import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/http_helper.dart';

import '../../data/datasources/pokemon_datasource.dart';

class PokemonApiDataSource implements PokemonDatasource {
  final String baseUrl = dotenv.env['BASE_URL']!;
  final HttpHelper httpHelper;
  PokemonApiDataSource({ required this.httpHelper });

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
