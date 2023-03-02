// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetails _$PokemonDetailsFromJson(Map<String, dynamic> json) =>
    PokemonDetails(
      PokemonDetails._extractGenera(json['genera'] as List),
      PokemonDetails._extractFlavorText(json['flavor_text_entries'] as List),
      json['gender_rate'] as int,
      PokemonDetails._extractEggGroups(json['egg_groups'] as List),
      json['hatch_counter'] as int,
    );

Map<String, dynamic> _$PokemonDetailsToJson(PokemonDetails instance) =>
    <String, dynamic>{
      'genera': instance.genera,
      'flavor_text_entries': instance.flavorText,
      'egg_groups': instance.eggGroups,
      'gender_rate': instance.genderRate,
      'hatch_counter': instance.hatchCounter,
    };
