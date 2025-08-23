// Ficheiro: lib/presentation/pages/designated_coach/designated_coach_details_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart'; // ✅ 1. IMPORTAR GO_ROUTER E ROTAS
import 'package:playifs_frontend/core/routing/app_routes.dart';
// ✅ 2. IMPORTAR O PROVIDER DE DETALHES
import 'package:playifs_frontend/presentation/providers/designated_coach/designated_coach_details_provider.dart';
import 'package:playifs_frontend/presentation/widgets/app_scaffold.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

class DesignatedCoachDetailsPage extends ConsumerWidget {
  const DesignatedCoachDetailsPage({super.key, required this.designationId});
  final int designationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ 3. USAR O NOME CORRETO DO PROVIDER
    final detailsState = ref.watch(designatedCoachDetailsNotifierProvider(designationId));

    return AppScaffold(
      title: 'Detalhes da Designação',
      actions: [
        IconButton(
          icon: const Icon(Icons.edit_outlined),
          tooltip: 'Editar Designação',
          // ✅ 4. IMPLEMENTAR A NAVEGAÇÃO PARA A EDIÇÃO
          onPressed: () => context.pushNamed(
            AppRoutes.editDesignatedCoach,
            pathParameters: {'id': designationId.toString()},
          ),
        ),
      ],
      body: detailsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => ErrorDisplay(
          error: error,
          onRetry: () => ref.invalidate(designatedCoachDetailsNotifierProvider(designationId)),
        ),
        data: (details) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildInfoCard('Competição', details.competition.name, Icons.emoji_events_outlined),
            _buildInfoCard('Desporto', details.sport.name, Icons.sports_soccer_outlined),
            _buildInfoCard('Curso', details.course.name, Icons.school_outlined),
            _buildInfoCard('Técnico Designado', details.coach.fullName, Icons.person_pin_outlined),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String subtitle, IconData icon) => Card(
    margin: const EdgeInsets.only(bottom: 16),
    child: ListTile(
      leading: Icon(icon, size: 40),
      title: Text(title),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    ),
  );
}