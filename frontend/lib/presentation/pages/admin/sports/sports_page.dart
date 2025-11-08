// Ficheiro: lib/presentation/pages/admin/sports/sports_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/presentation/providers/sport/sports_provider.dart';
import 'package:playifs_frontend/presentation/widgets/app_scaffold.dart'; // Supondo um Scaffold padrão
import 'package:playifs_frontend/presentation/widgets/error_display.dart'; // Supondo um widget de erro padrão

import 'widgets/sport_search_bar.dart';
import 'widgets/sports_list_view.dart';

class SportsPage extends ConsumerWidget {
  const SportsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sportsState = ref.watch(sportsProvider);

    return AppScaffold(
      title: 'Gestão de Desportos',
      body: Column(
        children: [
          const SportSearchBar(),
          Expanded(
            child: sportsState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => ErrorDisplay(
                error: error,
                onRetry: () => ref.invalidate(sportsProvider),
              ),
              data: (sportsPage) => SportsListView(sportsPage: sportsPage),
            ),
          ),
        ],
      ),
      fab: FloatingActionButton(
        onPressed: () {
          // TODO: Navegar para a página de criação de desporto.
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}