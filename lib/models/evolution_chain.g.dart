// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_chain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvolutionChain _$EvolutionChainFromJson(Map<String, dynamic> json) =>
    EvolutionChain(
      (json['evolution_details'] as List<dynamic>)
          .map((e) => EvolutionDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['name'] as String,
      (json['chain'] as List<dynamic>)
          .map((e) => EvolutionChain.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EvolutionChainToJson(EvolutionChain instance) =>
    <String, dynamic>{
      'evolution_details': instance.evolutionDetails,
      'name': instance.name,
      'chain': instance.chain,
    };
