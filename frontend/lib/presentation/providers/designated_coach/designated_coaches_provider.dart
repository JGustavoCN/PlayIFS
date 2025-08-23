// Ficheiro: lib/presentation/providers/designated_coach/designated_coaches_provider.dart

import 'dart:async';

import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_summary.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/usecases/designated_coach/find_all_designated_coaches_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'designated_coaches_provider.g.dart';

// Este é um provider de "família", pois o seu estado depende de um competitionId.
@riverpod
class DesignatedCoachesNotifier extends _$DesignatedCoachesNotifier {
  late final FindAllDesignatedCoachesUseCase _findAllUseCase = locator<FindAllDesignatedCoachesUseCase>();

  @override
  Future<Page<DesignatedCoachSummary>> build(int competitionId) {
    // A busca inicial é sempre filtrada pela competição.
    return _fetchPage(0, competitionId: competitionId);
  }

  Future<Page<DesignatedCoachSummary>> _fetchPage(
      int page, {
        required int competitionId,
        Map<String, dynamic>? otherFilters,
      }) async {
    final filters = {
      'competitionId': competitionId,
      ...?otherFilters,
    };

    final result = await _findAllUseCase.execute(page: page, filters: filters);
    return result.when(
      success: (data) => data,
      failure: (error) => throw error,
    );
  }

// A lógica de paginação e busca pode ser adicionada aqui, similar aos outros notifiers de lista.
}