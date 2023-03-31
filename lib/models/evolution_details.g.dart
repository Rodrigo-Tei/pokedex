// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvolutionDetails _$EvolutionDetailsFromJson(Map<String, dynamic> json) =>
    EvolutionDetails(
      Item.fromJson(json['item'] as Map<String, dynamic>),
      json['gender'] as int,
      Item.fromJson(json['held_item'] as Map<String, dynamic>),
      Move.fromJson(json['known_move'] as Map<String, dynamic>),
      json['known_move_type'] as String,
      json['location'] as String,
      json['min_affection'] as int,
      json['min_beauty'] as int,
      json['min_happiness'] as int,
      json['min_level'] as int,
      json['needs_overworld_rain'] as bool,
      json['party_species'] as String,
      json['party_type'] as String,
      json['relative_physical_stats'] as int,
      json['time_of_day'] as String,
      json['trade_species'] as String,
      json['trigger'] as String,
      json['turn_upside_down'] as bool,
    );

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
