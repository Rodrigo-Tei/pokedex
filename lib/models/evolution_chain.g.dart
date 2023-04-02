// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_chain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvolutionChain _$EvolutionChainFromJson(Map<String, dynamic> json) =>
    EvolutionChain(
      EvolutionChain._getName(json['species'] as Map<String, dynamic>),
      (json['evolves_to'] as List<dynamic>)
          .map((e) => EvolutionChain.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..evolutionDetails = (json['evolution_details'] as List<dynamic>?)
        ?.map((e) => EvolutionDetails.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$EvolutionChainToJson(EvolutionChain instance) =>
    <String, dynamic>{
      'evolution_details': instance.evolutionDetails,
      'species': instance.name,
      'evolves_to': instance.chain,
    };
