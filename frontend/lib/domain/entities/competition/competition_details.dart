// Ficheiro: lib/domain/entities/competition/competition_details.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'competition_details.freezed.dart';

/// Representa os dados detalhados de uma Competição.
@freezed
abstract class CompetitionDetails with _$CompetitionDetails {
  /// Construtor para criar uma instância imutável de CompetitionDetails.
  const factory CompetitionDetails({
    required int id,
    required String name,
    required String level,
  }) = _CompetitionDetails;
}