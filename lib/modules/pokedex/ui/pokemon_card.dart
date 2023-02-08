import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 48.0,
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 26.0, 16.0),
        color: Colors.blue,
        child: Text(pokemon.name),
      ),
    );
  }
}
