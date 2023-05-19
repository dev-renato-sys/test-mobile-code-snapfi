import 'package:flutter/material.dart';

class PokemonInfosDto {
  final IconData icon;
  final String text;
  final String label;

  PokemonInfosDto(this.icon, this.text, this.label, );
}

class PokemonInfos extends StatelessWidget {
  final List<PokemonInfosDto> listPokemonInfosDto;

  const PokemonInfos({super.key, required this.listPokemonInfosDto});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ...listPokemonInfosDto.map((PokemonInfosDto e) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (listPokemonInfosDto.indexOf(e) != 0)
                VerticalDivider(
                  width: 30,
                  thickness: 1,
                  // indent: 20,
                  endIndent: 0,
                  color: Colors.grey[350],
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        e.icon,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(e.text)
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(e.label)
                ],
              ),
            ],
          ))
    ]);
  }
}
