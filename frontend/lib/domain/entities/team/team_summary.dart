import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_summary.freezed.dart';

@freezed
abstract class TeamSummary with _$TeamSummary {
  const factory TeamSummary({
    required int id,
    required String name,
    // ✅ CORREÇÃO: Removidos os campos que não pertencem ao resumo.
  }) = _TeamSummary;
}