// Ficheiro: lib/domain/entities/competition/competition_input.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'competition_input.freezed.dart';

/// Representa os dados de entrada para criar ou atualizar uma Competição.
@freezed
abstract class CompetitionInput with _$CompetitionInput {
  /// Construtor para criar uma instância imutável de CompetitionInput.
  const factory CompetitionInput({
    required String name,
    required String level,
  }) = _CompetitionInput;
}