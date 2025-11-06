// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_reschedule_batch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameRescheduleBatchDTO _$GameRescheduleBatchDTOFromJson(
  Map<String, dynamic> json,
) => _GameRescheduleBatchDTO(
  schedules: (json['schedules'] as List<dynamic>)
      .map((e) => GameRescheduleItemDTO.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GameRescheduleBatchDTOToJson(
  _GameRescheduleBatchDTO instance,
) => <String, dynamic>{
  'schedules': instance.schedules.map((e) => e.toJson()).toList(),
};
