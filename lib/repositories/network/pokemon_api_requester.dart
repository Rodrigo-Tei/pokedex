import 'dart:convert';
import 'dart:io';

import 'package:pokedex/repositories/network/base_api_requester.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonListRequester {
  static Future<List<Pokemon>> getPokemonList() async {
    final pokemonUri = Uri.https(
      'pokeapi.co',
      '/api/v2/pokemon/',
      {'limit': '10', 'offset': '0'},
    );

    final response = await BaseApiRequester.send(pokemonUri);

    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> responseJson = json.decode(response.body);
      final List<Pokemon> pokemonList = responseJson['results']
          .map<Pokemon>((json) => Pokemon.fromJson(json))
          .toList();
      return pokemonList;
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg, uri: pokemonUri);
    }
  }
}
