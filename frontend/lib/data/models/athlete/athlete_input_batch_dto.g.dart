// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'athlete_input_batch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AthleteInputBatchDTO _$AthleteInputBatchDTOFromJson(
  Map<String, dynamic> json,
) => _AthleteInputBatchDTO(
  athletes: (json['athletes'] as List<dynamic>)
      .map((e) => AthleteInputDTO.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AthleteInputBatchDTOToJson(
  _AthleteInputBatchDTO instance,
) => <String, dynamic>{'athletes': instance.athletes};
