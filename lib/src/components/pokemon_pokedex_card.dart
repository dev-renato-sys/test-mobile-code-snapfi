import 'package:flutter/material.dart';

class PokemonPokedexSkeleton extends StatelessWidget {
  final Widget child;
  const PokemonPokedexSkeleton({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
            ),
            const BoxShadow(
              color: Colors.white,
              spreadRadius: -1.0,
              blurRadius: 1.0,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
        child: child,
      ),
    );
  }
}
