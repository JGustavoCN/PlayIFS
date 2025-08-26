// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition_input_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompetitionInputDTO _$CompetitionInputDTOFromJson(Map<String, dynamic> json) =>
    _CompetitionInputDTO(
      name: json['name'] as String,
      level: json['level'] as String,
      sportIds: (json['sportIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$CompetitionInputDTOToJson(
  _CompetitionInputDTO instance,
) => <String, dynamic>{
  'name': instance.name,
  'level': instance.level,
  'sportIds': instance.sportIds,
};
