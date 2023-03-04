import 'package:flutter/material.dart';
import 'package:pokedex/helpers/build_pokemon_number.dart';
import 'package:pokedex/helpers/pokemon_strings_helper.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/theme/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StatsTab extends StatelessWidget {
  final Pokemon pokemon;
  final Color color;

  const StatsTab({
    Key? key,
    required this.pokemon,
    required this.color,
  }) : super(key: key);

  static const rowSpacer = TableRow(children: [
    SizedBox(height: 8.0),
    SizedBox(height: 8.0),
    SizedBox(height: 8.0),
  ]);

  TableRow _buildStatRow(String statText, int statPercentage) {
    return TableRow(
      children: [
        Text(
          handleStatName(statText),
          style: TextStyle(
              color: DefaultTheme.grayscale[Grayscale.gray],
              fontSize: 14.0,
              fontWeight: FontWeight.w500),
        ),
        Text(statPercentage.toString()),
        LinearPercentIndicator(
          animation: true,
          barRadius: const Radius.circular(16.0),
          lineHeight: 8.0,
          percent: setStatPercentage(statPercentage),
          backgroundColor: DefaultTheme.grayscale[Grayscale.lightGray],
          progressColor: color,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Base Stats", //TODO: ADD HEXAGONAL VIEW
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 16.0),
          Table(
            columnWidths: {
              0: FixedColumnWidth(MediaQuery.of(context).size.width * 0.2),
              1: FixedColumnWidth(MediaQuery.of(context).size.width * 0.08),
              2: FixedColumnWidth(MediaQuery.of(context).size.width * 0.6),
            },
            children: [
              for (int i = 0; i < pokemon.stats.length * 2; i++)
                if (i % 2 == 0)
                  rowSpacer
                else
                  _buildStatRow(pokemon.stats[i ~/ 2].name,
                      pokemon.stats[i ~/ 2].baseStat)
            ],
          ),
        ],
      ),
    );
  }
}
