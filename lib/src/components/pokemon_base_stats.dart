import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:snapfi_app/helpers/hex_color.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/models/pokemon_detail.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/models/pokemon_detail/stats.dart';

class PokemonBaseStats extends StatelessWidget {
  final PokemonDetail pokemonDetail;
  const PokemonBaseStats({super.key, required this.pokemonDetail});

  @override
  Widget build(BuildContext context) {
    Color pokemonColor = pokemonDetail.types![0].type!.getColorBasedOnAbility();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Text('Base Stats',
              style: TextStyle(
                  color: pokemonDetail.types![0].type!.getColorBasedOnAbility(),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w900)),
          const SizedBox(
            height: 20.0,
          ),
          Table(
            columnWidths: const <int, TableColumnWidth>{
              0: FlexColumnWidth(),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(5),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              ...pokemonDetail.stats!.map((Stats e) => TableRow(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  width: 1,
                                  color: Colors
                                      .grey[400]!)), // Define a borda direita para a célula interna
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              e.stat
                                      ?.getCorrectNameBasedOnNaming()
                                      .toUpperCase() ??
                                  'N/A',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: pokemonColor,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ),
                      Center(child: Text(e.getBaseStat(),)),
                      LinearPercentIndicator(
                          percent: e.baseStat! / 200,
                          progressColor: pokemonColor,
                          backgroundColor:
                              HexColor.createMaterialColor(pokemonColor)[50])
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
