// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      json['name'] as String,
      json['id'] as int,
      Pokemon._extractPokemonTypes(json['types'] as List),
      json['weight'] as int,
      json['height'] as int,
      Pokemon._extractPokemonStats(json['stats'] as List),
      (json['moves'] as List<dynamic>)
          .map((e) => Move.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'name': instance.name,
      'weight': instance.weight,
      'height': instance.height,
      'id': instance.pokedexNumber,
      'types': instance.types,
      'stats': instance.stats,
      'moves': instance.moves,
    };
