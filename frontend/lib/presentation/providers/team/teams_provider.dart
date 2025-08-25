import 'dart:async';

import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/shared/id_batch.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/entities/team/team_summary.dart';
import 'package:playifs_frontend/domain/usecases/team/batch_delete_teams_use_case.dart';
import 'package:playifs_frontend/domain/usecases/team/find_all_teams_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'teams_provider.g.dart';

@riverpod
class TeamsNotifier extends _$TeamsNotifier {
  final _findAllUseCase = locator<FindAllTeamsUseCase>();
  final _batchDeleteUseCase = locator<BatchDeleteTeamsUseCase>();

  String _currentSearchTerm = '';

  @override
  Future<Page<TeamSummary>> build({int? competitionId}) async {
    final filters = <String, dynamic>{
      'competitionId': competitionId,
    }..removeWhere((key, value) => value == null);

    // ✅ CORREÇÃO 1: Usando a invocação direta que corresponde ao método 'call()'.
    final result = await _findAllUseCase(filters: filters);
    return result.when(
      success: (page) => page,
      failure: (error) => throw error,
    );
  }

  /// Busca a próxima página. Lança uma exceção em caso de erro.
  /// A UI deve usar um try/catch para exibir feedback de erro.
  Future<void> fetchNextPage() async {
    final currentState = state.value;
    if (currentState == null || (currentState.number >= currentState.totalPages - 1)) {
      return;
    }

    final nextPage = currentState.number + 1;

    final filters = <String, dynamic>{
      'competitionId': competitionId,
      'name': _currentSearchTerm.isEmpty ? null : _currentSearchTerm,
    }..removeWhere((key, value) => value == null);

    final result = await _findAllUseCase(page: nextPage, filters: filters);

    result.when(
      success: (newPage) {
        final combinedList = [...currentState.content, ...newPage.content];
        state = AsyncData(newPage.copyWith(content: combinedList));
      },
      // ✅ CORREÇÃO 3: Tratamento de erro robusto.
      failure: (error) => throw error,
    );
  }

  Future<void> search({String? name}) async {
    _currentSearchTerm = name ?? '';
    state = const AsyncLoading();

    final filters = <String, dynamic>{
      'competitionId': competitionId,
      'name': _currentSearchTerm.isEmpty ? null : _currentSearchTerm,
    }..removeWhere((key, value) => value == null);

    final result = await _findAllUseCase(filters: filters);
    state = result.when(
      success: (page) => AsyncData(page),
      failure: (error) => AsyncError(error, StackTrace.current),
    );
  }

  /// Apaga equipas em lote. Lança uma exceção em caso de erro.
  /// A UI deve usar um try/catch para exibir feedback de erro.
  Future<void> batchDeleteTeams(List<int> teamIds) async {
    final batch = IdBatch(ids: teamIds);
    final result = await _batchDeleteUseCase(batch);

    result.when(
      success: (_) => ref.invalidateSelf(),
      // ✅ CORREÇÃO 3: Tratamento de erro robusto.
      failure: (error) => throw error,
    );
  }
}