import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/routing/app_routes.dart';
import 'package:playifs_frontend/presentation/providers/designated_coach/my_designations_provider.dart';
import 'package:playifs_frontend/presentation/widgets/app_scaffold.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

class MyDesignationsPage extends ConsumerWidget {
  const MyDesignationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myDesignationsAsync = ref.watch(myDesignationsProvider);

    return AppScaffold(
      title: 'Minhas Vagas de Técnico',
      body: myDesignationsAsync.when(
        data: (designations) {
          if (designations.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Você ainda não foi designado como técnico para nenhuma vaga.',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.refresh(myDesignationsProvider.future),
            child: ListView.builder(
              itemCount: designations.length,
              itemBuilder: (context, index) {
                final designation = designations[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.assignment_ind_outlined),
                    title: Text(designation.competitionName),
                    subtitle: Text('${designation.sportName} - ${designation.courseName}'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // Navega para a página de detalhes da designação específica
                      context.pushNamed(
                        AppRoutes.designatedCoachDetails,
                        pathParameters: {'id': designation.id.toString()},
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
        error: (error, stack) => ErrorDisplay(
          error: error,
          onRetry: () => ref.invalidate(myDesignationsProvider),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}