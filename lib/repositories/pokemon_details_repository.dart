import 'dart:async';

import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/repositories/network/pokemon_details_requester.dart';

class PokemonDetailsRepository {
  Future<PokemonDetails> getPokemonDetails(int pokemonIndex) async {
    return PokemonDetailsRequester.getPokemonDetails(pokemonIndex);
  }
}
