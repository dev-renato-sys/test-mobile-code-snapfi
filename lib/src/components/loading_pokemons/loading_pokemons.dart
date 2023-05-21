import 'package:flutter/material.dart';
import 'package:snapfi_app/src/theme/light.dart';

class LoadingPokemons extends StatelessWidget {
  final String text;
  const LoadingPokemons(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: primaryColor,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            text,
            // style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
