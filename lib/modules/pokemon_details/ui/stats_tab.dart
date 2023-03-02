import 'package:flutter/material.dart';
import 'package:pokedex/helpers/build_pokemon_number.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/theme/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StatsTab extends StatelessWidget {
  final PokemonDetails pokemonDetails;
  final Color color;

  const StatsTab({
    Key? key,
    required this.pokemonDetails,
    required this.color,
  }) : super(key: key);

  static const rowSpacer = TableRow(children: [
    SizedBox(height: 4.0),
    SizedBox(height: 4.0),
    SizedBox(height: 4.0),
  ]);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24.0),
      child: Table(
        columnWidths: const {
          0: FixedColumnWidth(30),
          1: FixedColumnWidth(1),
          2: FixedColumnWidth(220),
        },
        children: [
          TableRow(
            children: [
              Text(
                "Defense",
                style: TextStyle(
                    color: DefaultTheme.grayscale[Grayscale.gray],
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500),
              ),
              const Text('50'),
              LinearPercentIndicator(
                animation: true,
                barRadius: const Radius.circular(16.0),
                lineHeight: 8.0,
                percent: setStatPercentage(50),
                backgroundColor: DefaultTheme.grayscale[Grayscale.lightGray],
                progressColor: color,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
