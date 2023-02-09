import 'package:flutter/material.dart';
import 'package:pokedex/helpers/color_helper.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/theme/colors.dart';

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
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          color: getColorFromType(pokemon.types[0]),
        ),
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 26.0, 16.0),
        child: Text(
          pokemon.name,
          style: TextStyle(
              color: DefaultTheme.grayscale[Grayscale.white], fontSize: 18.0),
        ),
      ),
    );
  }
}
