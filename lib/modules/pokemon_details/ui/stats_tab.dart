import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_details.dart';

class StatsTab extends StatelessWidget {
  final PokemonDetails pokemonDetails;

  const StatsTab({
    Key? key,
    required this.pokemonDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24.0),
      child: Text('STATS'),
    );
  }
}
