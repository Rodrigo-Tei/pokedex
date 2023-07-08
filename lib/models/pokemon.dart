import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/models/stat.dart';

part 'pokemon.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Pokemon {
  Pokemon(
    this.name,
    this.pokedexNumber,
    this.types,
    this.weight,
    this.height,
    this.stats,
  );

  String name;
  int weight;
  int height;
  @JsonKey(name: 'id')
  int pokedexNumber;
  @JsonKey(name: 'types', fromJson: _extractPokemonTypes)
  List<String> types;
  @JsonKey(includeToJson: false, includeFromJson: false)
  Image? image;
  @JsonKey(name: 'stats', fromJson: _extractPokemonStats)
  List<Stat> stats;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  static List<Stat> _extractPokemonStats(List<dynamic> stats) {
    List<Stat> pokemonStats = List.empty(growable: true);
    for (var stat in stats) {
      late Stat singleStat = Stat('', 0);
      singleStat.name = stat["stat"]["name"];
      singleStat.baseStat = stat["base_stat"];
      pokemonStats.add(singleStat);
    }
    return pokemonStats;
  }

  static List<String> _extractPokemonTypes(List types) {
    List<String> pokemonTypes = List.empty(growable: true);
    for (var type in types) {
      pokemonTypes.add(type['type']['name']);
    }
    return pokemonTypes;
  }

  @override
  String toString() {
    return 'Pokemon{name: $name, types: $types}'; //TODO: UPDATE THIS
  }
}
