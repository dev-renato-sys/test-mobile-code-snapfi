abstract class PokemonError implements Exception {}

class FailGetPokemon implements PokemonError {
  final String message;
  final int? statusCode;
  FailGetPokemon({required this.message, this.statusCode});
}

// class FailCheckUserLogged implements AuthError {}

// class FailLogout implements AuthError {}
