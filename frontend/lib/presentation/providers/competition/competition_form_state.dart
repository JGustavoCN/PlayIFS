// Ficheiro: lib/presentation/providers/competition/competition_form_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_details.dart';

part 'competition_form_state.freezed.dart';

@freezed
abstract class CompetitionFormState with _$CompetitionFormState {
  /// O estado inicial ou de repouso do formulário.
  const factory CompetitionFormState.initial() = _Initial;

  /// O estado durante uma operação assíncrona.
  const factory CompetitionFormState.loading() = _Loading;

  /// O estado de sucesso para operações que retornam dados (criar, atualizar).
  const factory CompetitionFormState.success(CompetitionDetails competition) = _Success;

  /// ✅ NOVO: Estado de sucesso específico para a operação de apagar.
  const factory CompetitionFormState.deleteSuccess() = _DeleteSuccess;

  /// O estado de falha após uma operação que resultou em erro.
  const factory CompetitionFormState.failure(Exception error) = _Failure;
}