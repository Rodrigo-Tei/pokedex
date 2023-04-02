// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvolutionDetails _$EvolutionDetailsFromJson(Map<String, dynamic> json) =>
    EvolutionDetails()
      ..item = json['item'] == null
          ? null
          : Item.fromJson(json['item'] as Map<String, dynamic>)
      ..trigger =
          EvolutionDetails._getName(json['trigger'] as Map<String, dynamic>?)
      ..gender = json['gender'] as int?
      ..heldItem = json['held_item'] == null
          ? null
          : Item.fromJson(json['held_item'] as Map<String, dynamic>)
      ..knownMove =
          EvolutionDetails._getName(json['known_move'] as Map<String, dynamic>?)
      ..knownMoveType = EvolutionDetails._getName(
          json['known_move_type'] as Map<String, dynamic>?)
      ..location =
          EvolutionDetails._getName(json['location'] as Map<String, dynamic>?)
      ..minLevel = json['min_level'] as int?
      ..minHappiness = json['min_happiness'] as int?
      ..minBeauty = json['min_beauty'] as int?
      ..minAffection = json['min_affection'] as int?
      ..needsOverworldRain = json['needs_overworld_rain'] as bool?
      ..partySpecies = EvolutionDetails._getName(
          json['party_species'] as Map<String, dynamic>?)
      ..partyType =
          EvolutionDetails._getName(json['party_type'] as Map<String, dynamic>?)
      ..relativePhysicalStats = json['relative_physical_stats'] as int?
      ..timeOfDay = json['time_of_day'] as String?
      ..tradeSpecies = EvolutionDetails._getName(
          json['trade_species'] as Map<String, dynamic>?)
      ..turnUpsideDown = json['turn_upside_down'] as bool?;

Map<String, dynamic> _$EvolutionDetailsToJson(EvolutionDetails instance) =>
    <String, dynamic>{
      'item': instance.item,
      'trigger': instance.trigger,
      'gender': instance.gender,
      'held_item': instance.heldItem,
      'known_move': instance.knownMove,
      'known_move_type': instance.knownMoveType,
      'location': instance.location,
      'min_level': instance.minLevel,
      'min_happiness': instance.minHappiness,
      'min_beauty': instance.minBeauty,
      'min_affection': instance.minAffection,
      'needs_overworld_rain': instance.needsOverworldRain,
      'party_species': instance.partySpecies,
      'party_type': instance.partyType,
      'relative_physical_stats': instance.relativePhysicalStats,
      'time_of_day': instance.timeOfDay,
      'trade_species': instance.tradeSpecies,
      'turn_upside_down': instance.turnUpsideDown,
    };
