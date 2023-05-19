import '../../domain/entities/pokemon_response_dto.dart';
import '../../domain/entities/pokemons_dto.dart';
import 'pokemon_model.dart';

class PokemonResponseModel extends PokemonResponseDto {
  PokemonResponseModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Pokemon>[];
      json['results'].forEach((v) {
        results!.add(PokemonModel.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['count'] = count;
  //   data['next'] = next;
  //   data['previous'] = previous;
  //   if (results != null) {
  //     // data['results'] = results!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}
