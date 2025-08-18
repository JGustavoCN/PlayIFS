// Ficheiro: lib/presentation/providers/sport/sports_provider.dart

import 'dart:async';

import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/entities/sport/sport_summary.dart';
import 'package:playifs_frontend/domain/usecases/sport/find_all_sports_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sports_provider.g.dart';

@riverpod
class SportsNotifier extends _$SportsNotifier {
  // Obtém a instância do caso de uso a partir do locator.
  late final FindAllSportsUseCase _findAllSportsUseCase = locator<FindAllSportsUseCase>();

  // O método 'build' é responsável pela busca inicial dos dados.
  @override
  Future<Page<SportSummary>> build() {
    // Busca a primeira página sem filtros.
    return _fetchSports(page: 0);
  }

  // Método privado para centralizar a lógica de busca.
  Future<Page<SportSummary>> _fetchSports({
    required int page,
    String? name,
  }) async {
    final filters = <String, dynamic>{};
    if (name != null && name.isNotEmpty) {
      filters['name'] = name;
    }

    final result = await _findAllSportsUseCase.execute(
      page: page,
      filters: filters,
    );

    return result.when(
      success: (page) => page,
      failure: (exception) => throw exception,
    );
  }

  /// Carrega a próxima página de resultados e anexa à lista atual.
  Future<void> loadNextPage() async {
    // Só prossegue se não estiver a carregar e se houver dados.
    if (state.isLoading || !state.hasValue) return;

    final currentPage = state.value!;
    // Verifica se já está na última página.
    if (currentPage.number >= currentPage.totalPages - 1) return;

    final nextPageData = await _fetchSports(page: currentPage.number + 1);

    // Atualiza o estado com a nova página, anexando o novo conteúdo.
    state = AsyncData(
      currentPage.copyWith(
        content: [...currentPage.content, ...nextPageData.content],
        number: nextPageData.number,
      ),
    );
  }

  /// Realiza uma nova busca com base no nome e reinicia a paginação.
  Future<void> searchByName(String name) async {
    // Define o estado como 'loading' para dar feedback à UI.
    state = const AsyncLoading();
    // Atualiza o estado com o resultado da nova busca.
    state = await AsyncValue.guard(() => _fetchSports(page: 0, name: name));
  }
}