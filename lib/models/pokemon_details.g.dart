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
    );

Map<String, dynamic> _$PokemonDetailsToJson(PokemonDetails instance) =>
    <String, dynamic>{
      'genera': instance.genera,
      'flavor_text_entries': instance.flavorText,
      'gender_rate': instance.genderRate,
    };
