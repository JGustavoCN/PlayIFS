// Ficheiro: lib/presentation/pages/admin/campuses/campuses_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/presentation/providers/campus/campuses_provider.dart';
import 'package:playifs_frontend/presentation/widgets/app_scaffold.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

import 'widgets/campus_search_bar.dart';
import 'widgets/campuses_list_view.dart';

class CampusesPage extends ConsumerWidget {
  const CampusesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campusesState = ref.watch(campusesNotifierProvider);

    return AppScaffold(
      title: 'Gestão de Campi',
      body: Column(
        children: [
          const CampusSearchBar(),
          Expanded(
            child: campusesState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => ErrorDisplay(
                error: error,
                onRetry: () => ref.invalidate(campusesNotifierProvider),
              ),
              data: (campusesPage) => CampusesListView(campusesPage: campusesPage),
            ),
          ),
        ],
      ),
      fab: FloatingActionButton(
        onPressed: () {
          // TODO: Navegar para a página de criação de campus.
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}