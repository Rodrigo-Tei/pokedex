// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonType _$PokemonTypeFromJson(Map<String, dynamic> json) => PokemonType(
      json['name'] as String,
      (json['damage_relations_to'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      (json['damage_relations_from'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$PokemonTypeToJson(PokemonType instance) =>
    <String, dynamic>{
      'name': instance.name,
      'damage_relations_to': instance.damageRelationsTo,
      'damage_relations_from': instance.damageRelationsFrom,
    };
