import 'package:flutter/material.dart';
import 'package:pokedex/helpers/build_pokemon_number.dart';
import 'package:pokedex/helpers/pokemon_strings_helper.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/modules/commons/type_tag.dart';
import 'package:pokedex/theme/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StatsTab extends StatelessWidget {
  final Pokemon pokemon;
  final Color color;
  final PokemonDetails pokemonDetails;

  const StatsTab({
    Key? key,
    required this.pokemon,
    required this.color,
    required this.pokemonDetails,
  }) : super(key: key);

  static const rowSpacer = TableRow(children: [
    SizedBox(height: 8.0),
    SizedBox(height: 8.0),
    SizedBox(height: 8.0),
  ]);

  Widget _buildTitleAndSubstitle(String title, [bool? isSubtitle]) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: isSubtitle == true ? 16.0 : 18.0,
      ),
    );
  }

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

  Widget _buildBaseStats(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitleAndSubstitle("Base stats"),
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
                _buildStatRow(
                    pokemon.stats[i ~/ 2].name, pokemon.stats[i ~/ 2].baseStat)
          ],
        )
      ],
    );
  }

  Widget _buildTagRow(Map<String, double> types, double desiredValue) {
    late List<String> selectedTypes = List.empty(growable: true);
    types.forEach((key, value) {
      if (value == desiredValue) selectedTypes.add(key);
    });

    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      child: selectedTypes.isEmpty
          ? const Tag(
              text: "None",
              isEggGroup: true,
            )
          : Wrap(
              children: [
                for (var type in selectedTypes)
                  Tag(
                    text: capitalizeFirstLetter(type),
                    isEggGroup: true,
                  )
              ],
            ),
    );
  }

  Widget _buildTypeEffectiveness() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitleAndSubstitle("Weaknesses"),
        const SizedBox(height: 12.0),
        _buildTitleAndSubstitle("4x", true),
        _buildTagRow(pokemonDetails.typeEffectiveness!, 4.0),
        const SizedBox(height: 12.0),
        _buildTitleAndSubstitle("2x", true),
        _buildTagRow(pokemonDetails.typeEffectiveness!, 2.0),
        const SizedBox(height: 12.0),
        _buildTitleAndSubstitle("1x", true),
        _buildTagRow(pokemonDetails.typeEffectiveness!, 1.0),
        const SizedBox(height: 12.0),
        _buildTitleAndSubstitle("1/2x", true),
        _buildTagRow(pokemonDetails.typeEffectiveness!, 0.5),
        const SizedBox(height: 12.0),
        _buildTitleAndSubstitle("1/4x", true),
        _buildTagRow(pokemonDetails.typeEffectiveness!, 0.25),
        const SizedBox(height: 12.0),
        _buildTitleAndSubstitle("Immune To", true),
        _buildTagRow(pokemonDetails.typeEffectiveness!, 0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBaseStats(context),
            const SizedBox(height: 24.0),
            _buildTypeEffectiveness(),
          ],
        ),
      ),
    );
  }
}
