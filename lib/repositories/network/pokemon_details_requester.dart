import 'dart:convert';
import 'dart:io';

import 'package:pokedex/helpers/pokemon_strings_helper.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/repositories/network/base_api_requester.dart';
import 'package:pokedex/constants.dart' as constants;

class PokemonDetailsRequester {
  static Future<PokemonDetails> getPokemonDetails(int pokedexNumber) async {
    final pokemonDetailsUri = Uri.https(
      constants.pokeapiBaseUrl,
      '${constants.pokemonSpeciesPath}$pokedexNumber',
    );

    final response = await BaseApiRequester.send(pokemonDetailsUri);

    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> responseJson = json.decode(response.body);
      final PokemonDetails pokemonDetails =
          PokemonDetails.fromJson(responseJson);
      pokemonDetails.flavorText = handleLineBreak(pokemonDetails.flavorText);
      return pokemonDetails;
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg, uri: pokemonDetailsUri);
    }
  }
}
