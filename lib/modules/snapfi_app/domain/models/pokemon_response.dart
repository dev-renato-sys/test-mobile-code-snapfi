// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'pokemons.dart';

class PokemonResponse {
  int? count;

  String? next;
  String? previous;

  List<Pokemon>? results;

  PokemonResponse({this.count, this.next, this.previous, this.results});

  PokemonResponse.fromJson(Map<String, dynamic> json) {
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
