// Ficheiro: lib/domain/entities/designated_coach/designated_coach_details.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/domain/entities/athlete/athlete_summary.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_summary.dart';
import 'package:playifs_frontend/domain/entities/course/course_summary.dart';
import 'package:playifs_frontend/domain/entities/sport/sport_summary.dart';

part 'designated_coach_details.freezed.dart';

/// Representa os dados detalhados de uma designação de técnico.
@freezed
abstract class DesignatedCoachDetails with _$DesignatedCoachDetails {
  /// Construtor para criar uma instância imutável.
  const factory DesignatedCoachDetails({
    required int id,
    required CompetitionSummary competition,
    required SportSummary sport,
    required CourseSummary course,
    required AthleteSummary coach,
  }) = _DesignatedCoachDetails;
}