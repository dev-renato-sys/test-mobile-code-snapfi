import 'package:flutter/material.dart';
import 'package:snapfi_app/src/bloc/pokemon/bloc.dart';
import 'package:snapfi_app/src/bloc/pokemon/event.dart';
import 'package:snapfi_app/src/theme/light.dart';

class SearchBarApp extends StatefulWidget {
  final TextEditingController searchController;
  final PokemonBloc pokemonBloc;
  const SearchBarApp(
      {super.key, required this.searchController, required this.pokemonBloc});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  late String value = '';

  void clearSearchBar() => {
        widget.pokemonBloc.add(PokemonFetchList()),
        setState(() {
          widget.searchController.clear();
        })
      };

  void onSubmitted(String? value) {
    widget.pokemonBloc.add(SearchForPokemon(name: value));
  }

  void onChanged(String? value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.bodyMedium,
      controller: widget.searchController,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(8, 16, 8, 12),
          hintText: 'Search',
          suffixIcon: widget.searchController.text.isEmpty
              ? null
              : IconButton(
                  onPressed: clearSearchBar,
                  icon: const Icon(Icons.remove_circle)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
          prefixIcon: Icon(
            Icons.search,
            color: primaryColor,
          )),
    );
  }
}
