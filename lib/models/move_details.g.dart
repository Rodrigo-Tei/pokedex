// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveDetails _$MoveDetailsFromJson(Map<String, dynamic> json) => MoveDetails(
      MoveDetails._extractLearnedMethod(
          json['move_learn_method'] as Map<String, dynamic>),
      json['level_learned_at'] as int,
    );

Map<String, dynamic> _$MoveDetailsToJson(MoveDetails instance) =>
    <String, dynamic>{
      'move_learn_method': instance.learnedMethod,
      'level_learned_at': instance.levelLearnedAt,
    };
