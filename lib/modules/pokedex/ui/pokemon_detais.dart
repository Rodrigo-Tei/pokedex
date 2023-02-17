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
          createRectTween: (begin, end) {
            return MaterialRectCenterArcTween(begin: begin, end: end);
          },
          tag: pokemon.pokedexNumber.toString(),
          transitionOnUserGestures: true,
          child: pokemon.image!,
        ),
      ),
    );
  }
}
