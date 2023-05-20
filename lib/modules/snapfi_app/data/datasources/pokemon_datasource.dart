import 'package:snapfi_app/modules/snapfi_app/domain/http_helper.dart';

abstract class PokemonDatasource {
  Future<HttpHelper> pokemons({int? limit});

  Future<HttpHelper> pokemon({String? filter});
}
