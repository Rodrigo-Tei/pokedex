import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pokedex/helpers/pokemon_strings_helper.dart';
import 'package:pokedex/models/evolution_chain.dart';
import 'package:pokedex/models/pokemon.dart';
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
      pokemonDetails.evolutionChain =
          await getEvolutionChain(responseJson["evolution_chain"]["url"]);
      return pokemonDetails;
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg, uri: pokemonDetailsUri);
    }
  }

  static Future<EvolutionChain> getEvolutionChain(
    String url,
  ) async {
    final splittedUrl = url.split('/');
    final chainIndex = splittedUrl[splittedUrl.length - 2];
    final pokemonDetailsUri = Uri.https(
      constants.pokeapiBaseUrl,
      '${constants.evolutionChain}$chainIndex',
    );

    final response = await BaseApiRequester.send(pokemonDetailsUri);

    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> responseJson = json.decode(response.body);
      final EvolutionChain evolutionChain =
          EvolutionChain.fromJson(responseJson["chain"]);
      handlePokemonInEvolutionchain(evolutionChain);
      return evolutionChain;
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg, uri: pokemonDetailsUri);
    }
  }

  static void handlePokemonInEvolutionchain(
      EvolutionChain evolutionChain) async {
    evolutionChain.pokemon = await getSinglePokemon(evolutionChain.name);
    evolutionChain.name = capitalizeFirstLetter(evolutionChain.name);
    evolutionChain.name = splitPokemonName(evolutionChain.name);
    if (evolutionChain.chain.isNotEmpty) {
      for (EvolutionChain evolution in evolutionChain.chain) {
        evolution.pokemon = await getSinglePokemon(evolution.name);
        if (evolution.chain.isNotEmpty) {
          handlePokemonInEvolutionchain(evolution);
        }
        if (evolution.evolutionDetails![0].item != null) {
          evolution.evolutionDetails![0].item!.image = Image.network(
            '${constants.itemImageUrl}${evolution.evolutionDetails![0].item!.name}.png', //TODO: THIS IS A FIELD OF THE API
            fit: BoxFit.fill,
          );
        }
        if (evolution.evolutionDetails![0].heldItem != null) {
          evolution.evolutionDetails![0].heldItem!.image = Image.network(
            '${constants.itemImageUrl}${evolution.evolutionDetails![0].heldItem!.name}.png', //TODO: THIS IS A FIELD OF THE API
            fit: BoxFit.fill,
          );
        }
      }
    }
  }

  static Future<Pokemon> getSinglePokemon(String pokemonName) async {
    final singlePokemonUri = Uri.https(
        constants.pokeapiBaseUrl, '${constants.pokemonPath}$pokemonName');
    final response = await BaseApiRequester.send(singlePokemonUri);

    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> responseJson = json.decode(response.body);
      final Pokemon pokemon = Pokemon.fromJson(responseJson);
      pokemon.image = Image.network(
        '${constants.pokemonImageUrl}${pokemon.pokedexNumber}.png', //TODO: THIS IS A FIELD OF THE API
        fit: BoxFit.fill,
      );
      return pokemon;
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg, uri: singlePokemonUri);
    }
  }
}
