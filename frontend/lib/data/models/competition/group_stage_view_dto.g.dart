// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_stage_view_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GroupStageViewDTO _$GroupStageViewDTOFromJson(Map<String, dynamic> json) =>
    _GroupStageViewDTO(
      groups: (json['groups'] as List<dynamic>)
          .map(
            (e) => GroupStandingsReportDTO.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$GroupStageViewDTOToJson(_GroupStageViewDTO instance) =>
    <String, dynamic>{'groups': instance.groups};
