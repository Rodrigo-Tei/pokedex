// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailedType _$DetailedTypeFromJson(Map<String, dynamic> json) => DetailedType(
      json['name'] as String,
      (json['damage_relations_to'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      (json['damage_relations_from'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$DetailedTypeToJson(DetailedType instance) =>
    <String, dynamic>{
      'name': instance.name,
      'damage_relations_to': instance.damageRelationsTo,
      'damage_relations_from': instance.damageRelationsFrom,
    };
