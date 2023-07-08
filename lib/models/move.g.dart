// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Move _$MoveFromJson(Map<String, dynamic> json) => Move(
      Move._extractMoveName(json['move'] as Map<String, dynamic>),
      Move._extractMoveDetails(json['version_group_details'] as List),
    );

Map<String, dynamic> _$MoveToJson(Move instance) => <String, dynamic>{
      'move': instance.name,
      'version_group_details': instance.moveDetails,
    };
