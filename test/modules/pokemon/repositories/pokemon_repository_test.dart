import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/models/pokemon_response.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/models/pokemon_detail.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/repositories/pokemon_repository.dart';
import 'route_mocks/pokemon_detail_mock.dart';
import 'route_mocks/pokemon_response_mock.dart';

@GenerateNiceMocks([MockSpec<PokemonRepository>()])
Future<void> main() async {
  test('test model [PokemonResponse]', () {
    PokemonResponse pokemonResponseModel =
        PokemonResponse.fromJson(pokemonResponseMockFromAPI);

    expect(pokemonResponseModel, isNotNull);
  });

  test('test model [PokemonDetail]', () {
    PokemonDetail pokemonResponseModel =
        PokemonDetail.fromJson(pokemonDetailMock);

    expect(pokemonResponseModel, isNotNull);
  });
}
