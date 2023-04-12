import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/models/item.dart';

part 'evolution_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EvolutionDetails {
  EvolutionDetails();

  Item? item;
  @JsonKey(fromJson: _getName)
  String? trigger;
  int? gender;
  Item? heldItem;
  @JsonKey(fromJson: _getName)
  String? knownMove;
  @JsonKey(fromJson: _getName)
  String? knownMoveType;
  @JsonKey(fromJson: _getName)
  String? location;
  int? minLevel;
  int? minHappiness;
  int? minBeauty;
  int? minAffection;
  bool? needsOverworldRain;
  @JsonKey(fromJson: _getName)
  String? partySpecies;
  @JsonKey(fromJson: _getName)
  String? partyType;
  int? relativePhysicalStats;
  String? timeOfDay;
  @JsonKey(fromJson: _getName)
  String? tradeSpecies;
  bool? turnUpsideDown;

  factory EvolutionDetails.fromJson(Map<String, dynamic> json) =>
      _$EvolutionDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionDetailsToJson(this);

  static String? _getName(Map<String, dynamic>? object) {
    return object?['name'];
  }

  @override
  String toString() {
    return '''EvolutionDetails{item: $item, trigger: $trigger,
    gender: $gender, heldItem: $heldItem, knownMove: $knownMove,
    knownMoveType: $knownMoveType, location: $location,
    minLevel: $minLevel, minHappiness: $minHappiness, minBeauty: $minBeauty,
    minAffection: $minAffection, needsOverworldRain: $needsOverworldRain,
    partySpecies: $partySpecies, partyType: $partyType, timeOfDay: $timeOfDay,
    tradeSpecies: $tradeSpecies, turnUpsideDown: $turnUpsideDown}''';
  }
}
