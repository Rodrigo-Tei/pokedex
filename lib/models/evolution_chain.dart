import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/models/evolution_details.dart';

part 'evolution_chain.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EvolutionChain {
  EvolutionChain(this.evolutionDetails, this.name, this.chain);

  List<EvolutionDetails> evolutionDetails;
  String name;
  List<EvolutionChain> chain;

  factory EvolutionChain.fromJson(Map<String, dynamic> json) =>
      _$EvolutionChainFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionChainToJson(this);

  @override
  String toString() {
    return 'EvolutionChain{chain: $chain}';
  }
}
