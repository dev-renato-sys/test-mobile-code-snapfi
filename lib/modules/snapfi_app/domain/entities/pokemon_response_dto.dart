// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'pokemons_dto.dart';

class PokemonResponseDto {
  int? count;

  String? next;
  String? previous;

  List<Pokemon>? results;

  PokemonResponseDto({this.count, this.next, this.previous, this.results});
}
