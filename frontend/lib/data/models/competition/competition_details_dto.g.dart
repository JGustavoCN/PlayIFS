// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompetitionDetailsDTO _$CompetitionDetailsDTOFromJson(
  Map<String, dynamic> json,
) => _CompetitionDetailsDTO(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  level: json['level'] as String,
  status: json['status'] as String?,
  associatedSports: (json['associatedSports'] as List<dynamic>)
      .map((e) => SportSummaryDTO.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CompetitionDetailsDTOToJson(
  _CompetitionDetailsDTO instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'level': instance.level,
  'status': instance.status,
  'associatedSports': instance.associatedSports,
};
