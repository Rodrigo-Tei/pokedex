import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/helpers/build_pokemon_number.dart';
import 'package:pokedex/helpers/color_helper.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/theme/colors.dart';

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
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: DefaultTheme.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        backgroundColor: DefaultTheme.transparent,
      ),
      backgroundColor: getColorFromType(pokemon.types[0]),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  pokemon.name,
                  style: TextStyle(
                    fontSize: 36.0,
                    color: DefaultTheme.grayscale[Grayscale.white],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  buildPokemonNumber(pokemon.pokedexNumber),
                  style: TextStyle(
                      fontSize: 20.0,
                      color: DefaultTheme.grayscale[Grayscale.white],
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    color: DefaultTheme.grayscale[Grayscale.white],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(36.0),
                      topRight: Radius.circular(36.0),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 350,
                left: MediaQuery.of(context).size.width / 2 -
                    137.45, // HALF SCREEN WIDTH - HALF IMAGE SIZE ---- TODO: GET RID OF MAGIC NUMBERS
                child: Hero(
                  createRectTween: (begin, end) {
                    return MaterialRectCenterArcTween(begin: begin, end: end);
                  },
                  tag: pokemon.pokedexNumber.toString(),
                  transitionOnUserGestures: true,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.width * 0.7,
                    child: pokemon.image!,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
