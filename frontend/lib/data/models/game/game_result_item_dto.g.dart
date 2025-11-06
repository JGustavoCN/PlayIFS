// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_result_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameResultItemDTO _$GameResultItemDTOFromJson(Map<String, dynamic> json) =>
    _GameResultItemDTO(
      gameId: (json['gameId'] as num).toInt(),
      scoreTeamA: (json['scoreTeamA'] as num).toInt(),
      scoreTeamB: (json['scoreTeamB'] as num).toInt(),
    );

Map<String, dynamic> _$GameResultItemDTOToJson(_GameResultItemDTO instance) =>
    <String, dynamic>{
      'gameId': instance.gameId,
      'scoreTeamA': instance.scoreTeamA,
      'scoreTeamB': instance.scoreTeamB,
    };
