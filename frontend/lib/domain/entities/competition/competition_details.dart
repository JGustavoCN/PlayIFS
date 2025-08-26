import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/domain/entities/sport/sport_summary.dart';

part 'competition_details.freezed.dart';

/// Representa os dados detalhados de uma Competição.
@freezed
abstract class CompetitionDetails with _$CompetitionDetails {
  /// Construtor para criar uma instância imutável de CompetitionDetails.
  const factory CompetitionDetails({
    required int id,
    required String name,
    required String level,
    // CORREÇÃO: O status pode ser nulo.
    required String? status,
    required List<SportSummary> associatedSports,
  }) = _CompetitionDetails;
}