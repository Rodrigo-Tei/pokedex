import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/models/evolution_details.dart';
import 'package:pokedex/models/pokemon.dart';

part 'evolution_chain.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EvolutionChain {
  EvolutionChain(this.name, this.chain);

  List<EvolutionDetails>? evolutionDetails;
  @JsonKey(name: 'species', fromJson: _getName)
  String name;
  @JsonKey(name: 'evolves_to')
  List<EvolutionChain> chain;
  @JsonKey(includeToJson: false, includeFromJson: false)
  Pokemon? pokemon;

  factory EvolutionChain.fromJson(Map<String, dynamic> json) =>
      _$EvolutionChainFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionChainToJson(this);

  static String _getName(Map<String, dynamic> species) {
    return species['name'];
  }

  @override
  String toString() {
    return 'EvolutionChain{name: $name, chain: $chain}';
  }
}
