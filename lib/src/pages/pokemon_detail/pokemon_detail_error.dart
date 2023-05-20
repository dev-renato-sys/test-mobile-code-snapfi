import 'package:flutter/material.dart';

class PokemonDetailError extends StatelessWidget {
  const PokemonDetailError({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/pokebola.png',
              width: 100,
              color: Colors.grey[300],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Pokemon não encontrado.',
            ),
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Voltar',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
