// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailedType _$DetailedTypeFromJson(Map<String, dynamic> json) => DetailedType(
      json['name'] as String,
      (json['no_damage_to'] as List<dynamic>)
          .map((e) => (e as Map<String, dynamic>).map(
                (k, e) => MapEntry(k, (e as num).toDouble()),
              ))
          .toList(),
      (json['half_damage_to'] as List<dynamic>)
          .map((e) => (e as Map<String, dynamic>).map(
                (k, e) => MapEntry(k, (e as num).toDouble()),
              ))
          .toList(),
      (json['single_damage_to'] as List<dynamic>)
          .map((e) => (e as Map<String, dynamic>).map(
                (k, e) => MapEntry(k, (e as num).toDouble()),
              ))
          .toList(),
      (json['double_damage_to'] as List<dynamic>)
          .map((e) => (e as Map<String, dynamic>).map(
                (k, e) => MapEntry(k, (e as num).toDouble()),
              ))
          .toList(),
      (json['no_damage_from'] as List<dynamic>)
          .map((e) => (e as Map<String, dynamic>).map(
                (k, e) => MapEntry(k, (e as num).toDouble()),
              ))
          .toList(),
      (json['half_damage_from'] as List<dynamic>)
          .map((e) => (e as Map<String, dynamic>).map(
                (k, e) => MapEntry(k, (e as num).toDouble()),
              ))
          .toList(),
      (json['single_damage_from'] as List<dynamic>)
          .map((e) => (e as Map<String, dynamic>).map(
                (k, e) => MapEntry(k, (e as num).toDouble()),
              ))
          .toList(),
      (json['double_damage_from'] as List<dynamic>)
          .map((e) => (e as Map<String, dynamic>).map(
                (k, e) => MapEntry(k, (e as num).toDouble()),
              ))
          .toList(),
    );

Map<String, dynamic> _$DetailedTypeToJson(DetailedType instance) =>
    <String, dynamic>{
      'name': instance.name,
      'no_damage_to': instance.noDamageTo,
      'half_damage_to': instance.halfDamageTo,
      'single_damage_to': instance.singleDamageTo,
      'double_damage_to': instance.doubleDamageTo,
      'no_damage_from': instance.noDamageFrom,
      'half_damage_from': instance.halfDamageFrom,
      'single_damage_from': instance.singleDamageFrom,
      'double_damage_from': instance.doubleDamageFrom,
    };
