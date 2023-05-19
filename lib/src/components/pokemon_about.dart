import 'package:flutter/material.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/entities/pokemon_detail_dto.dart';

class PokemonAbout extends StatelessWidget {
  final PokemonDetail pokemonDetail;
  const PokemonAbout({super.key, required this.pokemonDetail});

  @override
  Widget build(BuildContext context) {
    Decoration containerDecoration = const BoxDecoration(
      border: Border(
          right: BorderSide(
              width: 1.0,
              color:
                  Colors.grey)), // Define a borda direita para a célula interna
    );

    TextStyle textStyle = const TextStyle(fontSize: 10, color: Colors.grey);

    return Column(
      children: [
        Text('About',
            style: TextStyle(
                color: pokemonDetail.types![0].type!.getColorBasedOnAbility(),
                fontSize: 16.0,
                fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 20.0,
        ),
        Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                Container(
                  height: 60,
                  decoration: containerDecoration,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // const Icon(
                                //   Icons.line_weight,
                                //   color: Colors.black,
                                // ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text('${pokemonDetail.getDoubleWeight()} kg')
                              ]),
                        )),
                        Text(
                          'Weight',
                          style: textStyle,
                        )
                      ]),
                ),
                Container(
                  height: 60,
                  decoration: containerDecoration,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // const Icon(
                                //   Icons.height_outlined,
                                //   color: Colors.black,
                                // ),
                                Text('${pokemonDetail.getDoubleHeight()} m')
                              ]),
                        )),
                        Text(
                          'Height',
                          style: textStyle,
                        )
                      ]),
                ),
                SizedBox(
                  height: 60,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ...pokemonDetail.types!.map((e) =>
                                Text(e.type!.getNameUpperCaseFirstLetter())),
                          ],
                        )),
                        Text(
                          'Moves',
                          style: textStyle,
                        )
                      ]),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
