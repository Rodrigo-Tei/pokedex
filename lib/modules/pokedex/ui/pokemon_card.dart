import 'package:flutter/material.dart';
import 'package:pokedex/helpers/color_helper.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/modules/pokedex/ui/type_tag.dart';
import 'package:pokedex/theme/colors.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  Widget _buildTypeTag(List<String> types) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [for (var type in types) TypeTag(type: type)],
    );
  }

  Widget _buildPokemonName(String name) {
    return Text(
      name,
      style: TextStyle(
        color: DefaultTheme.grayscale[Grayscale.white],
        fontSize: 24.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: DefaultTheme.grayscale[Grayscale.lightGray]!,
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 3),
            ),
          ],
          image: const DecorationImage(
            opacity: 0.15,
            image: AssetImage(
              'lib/assets/images/pokeball-icon-white.png',
            ),
            fit: BoxFit.none,
            scale: 2.6,
            alignment: Alignment(5, -7),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          color: getColorFromType(pokemon.types[0]),
        ),
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPokemonName(pokemon.name),
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.network(
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.pokedexNumber}.png', //TODO: Bring this to repository and put image on Pokemon model
                          scale: 4.4,
                        )
                      ],
                    ),
                  ],
                ),
                _buildTypeTag(pokemon.types),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
