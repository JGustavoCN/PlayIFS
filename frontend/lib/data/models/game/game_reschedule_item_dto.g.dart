// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_reschedule_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameRescheduleItemDTO _$GameRescheduleItemDTOFromJson(
  Map<String, dynamic> json,
) => _GameRescheduleItemDTO(
  gameId: (json['gameId'] as num).toInt(),
  dateTime: json['dateTime'] as String,
);

Map<String, dynamic> _$GameRescheduleItemDTOToJson(
  _GameRescheduleItemDTO instance,
) => <String, dynamic>{
  'gameId': instance.gameId,
  'dateTime': instance.dateTime,
};
