import 'package:flutter/material.dart';

class PokemonErrorComponent extends StatelessWidget {
  final bool withGoBack;
  const PokemonErrorComponent({super.key, this.withGoBack = true});

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
            const Padding(padding: EdgeInsets.symmetric(horizontal: 80.0), child: Text(
              'Pokemon not founded, try correcting pokemon name on your search.',
              textAlign: TextAlign.center,
            ),),
            if (withGoBack)
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
