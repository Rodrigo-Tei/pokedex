import 'dart:async';

import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/repositories/network/pokemon_api_requester.dart';

class PokemonRepository {
  Future<List<Pokemon>> getUserPokemons(int pageIndex) async {
    return PokemonListRequester.getPokemonList(pageIndex);
  }
}
