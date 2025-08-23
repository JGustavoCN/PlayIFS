// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'designated_coach_input_batch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DesignatedCoachInputBatchDTO _$DesignatedCoachInputBatchDTOFromJson(
  Map<String, dynamic> json,
) => _DesignatedCoachInputBatchDTO(
  coaches: (json['coaches'] as List<dynamic>)
      .map((e) => DesignatedCoachInputDTO.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DesignatedCoachInputBatchDTOToJson(
  _DesignatedCoachInputBatchDTO instance,
) => <String, dynamic>{'coaches': instance.coaches};
