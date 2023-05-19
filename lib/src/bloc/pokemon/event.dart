import 'package:equatable/equatable.dart';

abstract class PokemonEvent extends Equatable {
  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [];
}

class PokemonFetchList extends PokemonEvent {
  final int? limit;
  PokemonFetchList({this.limit});
}

class SetLoadingPokemon extends PokemonEvent {
  final String message;

  SetLoadingPokemon({required this.message});
}

class SearchForPokemon extends PokemonEvent {
  final String? name;
  final String? id;

  SearchForPokemon({this.name, this.id});
}

class GetPokemonDetails extends PokemonEvent {
  final int idPokemon;

  GetPokemonDetails({required this.idPokemon});
}

class PokemonFetchListError extends PokemonEvent {}

class PokemonFetchListEmpty extends PokemonEvent {}
