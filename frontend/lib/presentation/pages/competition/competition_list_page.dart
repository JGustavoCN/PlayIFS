// Ficheiro: lib/presentation/pages/competition/competition_list_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/routing/app_routes.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart' as domain;
import 'package:playifs_frontend/presentation/providers/competition/competitions_provider.dart';
import 'package:playifs_frontend/presentation/widgets/app_scaffold.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

class CompetitionListPage extends ConsumerWidget {
  const CompetitionListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final competitionsState = ref.watch(competitionsNotifierProvider);

    return AppScaffold(
      title: 'Gestão de Competições',
      body: competitionsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => ErrorDisplay(
          error: error,
          onRetry: () => ref.invalidate(competitionsNotifierProvider),
        ),
        data: (pageData) => _CompetitionListView(page: pageData),
      ),
      fab: FloatingActionButton(
        onPressed: () => context.pushNamed(AppRoutes.createCompetition),
        tooltip: 'Nova Competição',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _CompetitionListView extends ConsumerWidget {
  const _CompetitionListView({required this.page});
  final domain.Page page;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final competitions = page.content;

    if (competitions.isEmpty) {
      return const Center(child: Text('Nenhuma competição encontrada.'));
    }

    return ListView.builder(
      itemCount: competitions.length,
      itemBuilder: (context, index) {
        final competition = competitions[index];
        return ListTile(
          leading: const Icon(Icons.emoji_events_outlined),
          title: Text(competition.name),
          subtitle: Text('Nível: ${competition.level}'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => context.pushNamed(
            AppRoutes.competitionDetails,
            pathParameters: {'id': competition.id.toString()},
          ),
        );
      },
    );
  }
}