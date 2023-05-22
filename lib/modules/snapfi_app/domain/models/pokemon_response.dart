// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'pokemons.dart';

class PokemonResponseDto {
  int? count;

  String? next;
  String? previous;

  List<Pokemon>? results;

  PokemonResponseDto({this.count, this.next, this.previous, this.results});

  PokemonResponseDto.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Pokemon>[];
      json['results'].forEach((v) {
        results!.add(Pokemon.fromJson(v));
      });
    }
  }
}
