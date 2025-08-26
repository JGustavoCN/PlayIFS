// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elimination_bracket_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EliminationBracketDTO _$EliminationBracketDTOFromJson(
  Map<String, dynamic> json,
) => _EliminationBracketDTO(
  rounds: (json['rounds'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(
      $enumDecode(_$GamePhaseEnumMap, k),
      (e as List<dynamic>)
          .map((e) => GameDetailsDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  ),
);

Map<String, dynamic> _$EliminationBracketDTOToJson(
  _EliminationBracketDTO instance,
) => <String, dynamic>{
  'rounds': instance.rounds.map((k, e) => MapEntry(_$GamePhaseEnumMap[k]!, e)),
};

const _$GamePhaseEnumMap = {
  GamePhase.GROUP_STAGE: 'GROUP_STAGE',
  GamePhase.ROUND_OF_16: 'ROUND_OF_16',
  GamePhase.QUARTER_FINALS: 'QUARTER_FINALS',
  GamePhase.SEMI_FINALS: 'SEMI_FINALS',
  GamePhase.THIRD_PLACE_DISPUTE: 'THIRD_PLACE_DISPUTE',
  GamePhase.FINAL: 'FINAL',
};
