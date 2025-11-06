// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameResultDTO _$GameResultDTOFromJson(Map<String, dynamic> json) =>
    _GameResultDTO(
      scoreTeamA: (json['scoreTeamA'] as num).toInt(),
      scoreTeamB: (json['scoreTeamB'] as num).toInt(),
    );

Map<String, dynamic> _$GameResultDTOToJson(_GameResultDTO instance) =>
    <String, dynamic>{
      'scoreTeamA': instance.scoreTeamA,
      'scoreTeamB': instance.scoreTeamB,
    };
