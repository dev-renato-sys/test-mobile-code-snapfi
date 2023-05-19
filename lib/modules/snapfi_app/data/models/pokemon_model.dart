import '../../domain/entities/pokemons_dto.dart';

class PokemonModel extends Pokemon {
  PokemonModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['name'] = name;
  //   data['url'] = url;
  //   return data;
  // }

  // int getId() {
  //   return int.parse(url!.split('pokemon/').last.replaceAll('/', ''));
  // }
}
