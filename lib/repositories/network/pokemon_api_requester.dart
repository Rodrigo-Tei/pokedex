import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pokedex/helpers/pokemon_strings_helper.dart';
import 'package:pokedex/models/base_pokemon.dart';
import 'package:pokedex/models/detailed_type.dart';
import 'package:pokedex/repositories/network/base_api_requester.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/constants.dart' as constants;

class PokemonListRequester {
  static Future<List<Pokemon>> getPokemonList(int pageIndex) async {
    int index = 20 * pageIndex;
    final pokemonListUri = Uri.https(
      constants.pokeapiBaseUrl,
      constants.pokemonPath,
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

    final singlePokemonUri = Uri.https(
        constants.pokeapiBaseUrl, '${constants.pokemonPath}$pokemonIndex');
    final response = await BaseApiRequester.send(singlePokemonUri);

    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> responseJson = json.decode(response.body);
      final Pokemon pokemon = Pokemon.fromJson(responseJson);
      pokemon.image = Image.network(
        '${constants.pokemonImageUrl}${pokemon.pokedexNumber}.png', //TODO: THIS IS A FIELD OF THE API
        fit: BoxFit.fill,
      );
      pokemon.types = [];
      for (var type in responseJson["types"]) {
        final detailedType = await getDetailedType(type["type"]["name"]);
        pokemon.types!.add(detailedType);
      }
      return pokemon;
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg, uri: basePokemon);
    }
  }

  static Future<PokemonType> getDetailedType(String type) async {
    type = undoCapitalizeFirstLetter(type);
    final pokemonListUri = Uri.https(
      constants.pokeapiBaseUrl,
      "${constants.pokemonType}$type",
    );

    final response = await BaseApiRequester.send(pokemonListUri);

    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> responseJson = json.decode(response.body);
      final name = responseJson["name"];
      late Map<String, double> damageRelationsTo = {};
      late Map<String, double> damageRelationsFrom = {};
      responseJson["damage_relations"].forEach((key, value) {
        switch (key) {
          case "double_damage_to":
            for (var type in value) {
              damageRelationsTo.addAll({"${type["name"]}": 2.0});
            }
            break;
          case "half_damage_to":
            for (var type in value) {
              damageRelationsTo.addAll({"${type["name"]}": 0.5});
            }
            break;
          case "no_damage_to":
            for (var type in value) {
              damageRelationsTo.addAll({"${type["name"]}": 0});
            }
            break;
          case "double_damage_from":
            for (var type in value) {
              damageRelationsFrom.addAll({"${type["name"]}": 2.0});
            }
            break;
          case "half_damage_from":
            for (var type in value) {
              damageRelationsFrom.addAll({"${type["name"]}": 0.5});
            }
            break;
          case "no_damage_from":
            for (var type in value) {
              damageRelationsFrom.addAll({"${type["name"]}": 0});
            }
            break;
        }
      });
      return PokemonType(name, damageRelationsTo, damageRelationsFrom);
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg, uri: pokemonListUri);
    }
  }
}
