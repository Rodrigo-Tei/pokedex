import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonDetails extends StatefulWidget {
  const PokemonDetails({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

@override
class _PokemonDetailsState extends State<PokemonDetails> {
  Pokemon get pokemon => widget.pokemon;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: pokemon.pokedexNumber.toString(),
          transitionOnUserGestures: true,
          child: Image.network(
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.pokedexNumber}.png', //TODO: Bring this to repository and put image on Pokemon model
            scale: 1.5,
          ),
        ),
      ),
    );
  }
}
