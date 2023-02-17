import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pokedex/models/base_pokemon.dart';
import 'package:pokedex/repositories/network/base_api_requester.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonListRequester {
  static Future<List<Pokemon>> getPokemonList(int pageIndex) async {
    int index = 20 * pageIndex;
    final pokemonListUri = Uri.https(
      'pokeapi.co',
      '/api/v2/pokemon/',
      {'limit': '20', 'offset': index.toString()},
    );

    final response = await BaseApiRequester.send(pokemonListUri);

    if (response.statusCode == HttpStatus.ok) {
      final List<Pokemon> finalPokemonList = List.empty(growable: true);
      final Map<String, dynamic> responseJson = json.decode(response.body);
      final List<BasePokemon> pokemonList = responseJson['results']
          .map<BasePokemon>((json) => BasePokemon.fromJson(json))
          .toList();
      for (BasePokemon basePokemon in pokemonList) {
        finalPokemonList.add(await getSinglePokemon(basePokemon));
      }
      return finalPokemonList;
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg, uri: pokemonListUri);
    }
  }

  static Future<Pokemon> getSinglePokemon(basePokemon) async {
    final url = basePokemon.url;
    final splittedUrl = url.split('/');
    final pokemonIndex = splittedUrl[splittedUrl.length - 2];

    final singlePokemonUri =
        Uri.https('pokeapi.co', '/api/v2/pokemon/$pokemonIndex');
    final response = await BaseApiRequester.send(singlePokemonUri);

    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> responseJson = json.decode(response.body);
      final Pokemon pokemon = Pokemon.fromJson(responseJson);
      pokemon.image = Image.network(
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.pokedexNumber}.png',
        fit: BoxFit.fill,
      );
      return pokemon;
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg, uri: basePokemon);
    }
  }
}
