// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_result_batch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameResultBatchDTO _$GameResultBatchDTOFromJson(Map<String, dynamic> json) =>
    _GameResultBatchDTO(
      results: (json['results'] as List<dynamic>)
          .map((e) => GameResultItemDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameResultBatchDTOToJson(_GameResultBatchDTO instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
