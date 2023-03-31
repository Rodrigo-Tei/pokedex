import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/models/item.dart';
import 'package:pokedex/models/move.dart';
import 'package:pokedex/models/pokemon_details.dart';

part 'evolution_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EvolutionDetails {
  EvolutionDetails(
    this.item,
    this.gender,
    this.heldItem,
    this.knownMove,
    this.knownMoveType,
    this.location,
    this.minAffection,
    this.minBeauty,
    this.minHappiness,
    this.minLevel,
    this.needsOverworldRain,
    this.partySpecies,
    this.partyType,
    this.relativePhysicalStats,
    this.timeOfDay,
    this.tradeSpecies,
    this.trigger,
    this.turnUpsideDown,
  );

  Item item;
  String trigger; //TRATAR
  int gender;
  Item heldItem;
  Move knownMove;
  String knownMoveType; //TRATAR
  String location; //TRATAR
  int minLevel;
  int minHappiness;
  int minBeauty;
  int minAffection;
  bool needsOverworldRain;
  String partySpecies; //TRATAR
  String partyType; //TRATAR
  int relativePhysicalStats;
  String timeOfDay;
  String tradeSpecies; //TRATAR
  bool turnUpsideDown;

  factory EvolutionDetails.fromJson(Map<String, dynamic> json) =>
      _$EvolutionDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionDetailsToJson(this);

  @override
  String toString() {
    return '''''';
  }
}
