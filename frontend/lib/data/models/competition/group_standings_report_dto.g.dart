// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_standings_report_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GroupStandingsReportDTO _$GroupStandingsReportDTOFromJson(
  Map<String, dynamic> json,
) => _GroupStandingsReportDTO(
  groupId: (json['groupId'] as num).toInt(),
  groupName: json['groupName'] as String,
  standings: (json['standings'] as List<dynamic>)
      .map((e) => TeamStandingDTO.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GroupStandingsReportDTOToJson(
  _GroupStandingsReportDTO instance,
) => <String, dynamic>{
  'groupId': instance.groupId,
  'groupName': instance.groupName,
  'standings': instance.standings,
};
