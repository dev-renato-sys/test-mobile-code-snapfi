import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/entities/pokemon_detail_dto.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/entities/pokemons_dto.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/errors/errors.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/usecases/get_pokemon.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/usecases/get_pokemons.dart';
import 'event.dart';
import 'state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  // late Box box;
  // PokemonService pokemonService;
  final GetPokemonsUsecase getPokemonsUsecase;
  final GetPokemonUsecase getPokemonUsecase;

  PokemonBloc(
      {required this.getPokemonsUsecase, required this.getPokemonUsecase})
      : super(const PokemonLoadingState(message: 'Procurando por pokemons..')) {
    on<SetLoadingPokemon>((event, emit) {
      emit(PokemonLoadingState(message: event.message));
    });
    on<PokemonFetchList>((event, emit) async {
      // emit(const PokemonLoadingState(message: 'Procurando por pokemons..'));
      Either<FailGetPokemon, List<Pokemon>> pokemons =
          await getPokemonsUsecase.call(limit: event.limit);

      pokemons.fold(
          (exception) =>
              emit(const PokemonErrorState(message: 'something went wrong :(')),
          (List<Pokemon> pokemonList) =>
              emit(PokemonLoadedState(pokemonList: pokemonList)));
    });
    on<SearchForPokemon>(
      (event, emit) async {
        emit(const PokemonLoadingState(message: 'Procurando por pokemons..'));

        Either<FailGetPokemon, PokemonDetail> pokemon =
            await getPokemonUsecase.call(name: event.name, id: event.id);

        pokemon.fold((FailGetPokemon exception) {
          if (exception.statusCode == 403) {
            emit(const PokemonErrorState(message: 'Pokemon não encontrado'));
          } else {
            emit(const PokemonErrorState(
                message: 'Ocorreu algo de errado com o servidor'));
          }
        },
            (PokemonDetail pokemonDetail) => emit(PokemonLoadedState(
                    pokemonList: [
                      Pokemon(
                          name: pokemonDetail.name,
                          url: pokemonDetail.id.toString())
                    ])));
      },
    );
    on<GetPokemonDetails>(
      (event, emit) async {
        emit(const PokemonLoadingState(message: ''));
        Either<FailGetPokemon, PokemonDetail> pokemonDetail =
            await getPokemonUsecase.call(id: event.idPokemon.toString());
        pokemonDetail.fold((FailGetPokemon exception) {
          if (exception.statusCode == 403) {
            emit(const PokemonErrorState(message: 'Pokemon não encontrado'));
          } else {
            emit(const PokemonErrorState(
                message: 'Ocorreu algo de errado com o servidor'));
          }
        },
            (PokemonDetail pokemonDetail) =>
                emit(PokemonDetailState(pokemonDetail: pokemonDetail)));
      },
    );
    // on<FavoritePokemon>(((event, emit) async {
    //   await addPokemonToFavorites.call(event.pokemon);

    //   Either<FailGetPokemon, List<Pokemon>> _getPokemon =
    //       await getPokemons.call();

    //   _getPokemon.fold(
    //       (exception) =>
    //           emit(const PokemonErrorState(message: 'something went wrong :(')),
    //       (pokemonList) => pokemonList.isEmpty
    //           ? emit(const PokemonErrorState(message: 'empty list :('))
    //           : emit(PokemonLoadedState(pokemonList: pokemonList)));
    // }));
    // on<AddMorePokemons>(((event, emit) async {
    //   await pokemonService.addMorePokemons(value: event.value);
    //   PokemonState pokemonLoadedState = await pokemonService.getPokemons();
    //   emit(pokemonLoadedState);
    // }));
  }
}
