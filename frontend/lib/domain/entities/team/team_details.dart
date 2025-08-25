import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/domain/entities/athlete/athlete_summary.dart';

part 'team_details.freezed.dart';

@freezed
abstract class TeamDetails with _$TeamDetails {
  const factory TeamDetails({
    required int id,
    required String name,
    // ✅ CORREÇÃO: A entidade de domínio agora contém os dados detalhados.
    required String competitionName,
    required int competitionId,
    required String sportName,
    required int sportId,
    required String courseName,
    required int courseId,
    required String coachName,
    required int coachId,
    required List<AthleteSummary> athletes,
  }) = _TeamDetails;
}