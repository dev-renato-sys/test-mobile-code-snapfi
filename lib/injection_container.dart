import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:snapfi_app/modules/snapfi_app/data/repositories/pokemon_repository_implementation.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/usecases/get_pokemon.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/usecases/get_pokemons.dart';
import 'package:snapfi_app/modules/snapfi_app/external/datasource/pokemon_implementation.dart';
import '../src/bloc/pokemon/bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<PokemonBloc>(
      () => PokemonBloc(getPokemonsUsecase: sl(), getPokemonUsecase: sl()));

  sl.registerLazySingleton<PokemonRepositoryImplementation>(
      () => PokemonRepositoryImplementation(pokemonApiDataSource: sl()));

  sl.registerLazySingleton<GetPokemonsUsecase>(
      () => GetPokemonsUsecase(pokemonRepositoryImplementation: sl()));

  sl.registerLazySingleton<GetPokemonUsecase>(
      () => GetPokemonUsecase(pokemonRepositoryImplementation: sl()));

  sl.registerLazySingleton<PokemonApiDataSource>(
      () => PokemonApiDataSource(dio: sl()));

  sl.registerLazySingleton(() => Dio());
}
