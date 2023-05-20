abstract class PokemonError implements Exception {}

class FailGetPokemon implements PokemonError {
  String message;
  final int? statusCode;
  FailGetPokemon({required this.message, this.statusCode});
}