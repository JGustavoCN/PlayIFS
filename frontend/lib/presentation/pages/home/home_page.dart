// Ficheiro: lib/presentation/pages/home/home_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/routing/app_routes.dart';

import '../../../domain/entities/user/profile.dart';
import '../../providers/auth/auth_provider.dart';
import '../../providers/profile/profile_provider.dart';
import '../../widgets/theme_toggle_button.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('PlayIFS'),
        actions: [
          const ThemeToggleButton(),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sair',
            onPressed: () => ref.read(authProvider.notifier).logout(),
          ),
        ],
      ),
      body: profileState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Ocorreu um erro ao buscar o seu perfil:\n${error.toString()}',
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ),
        data: (profile) => ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildProfileCard(context, profile),
            const SizedBox(height: 16),
            _buildAdminPanel(context, profile),
          ],
        ),
      ),
    );
  }

  /// Constrói o painel de navegação para funcionalidades de gestão.
  Widget _buildAdminPanel(BuildContext context, Profile profile) {
    final requiredRoles = {'ROLE_COORDINATOR', 'ROLE_ATHLETE'};
    final userRoles = profile.roles.toSet();
    final hasPermission = userRoles.intersection(requiredRoles).isNotEmpty;

    if (!hasPermission) {
      return const SizedBox.shrink();
    }

    // Apenas Coordenadores podem ver o painel de gestão completo.
    // Atletas verão um painel diferente no futuro.
    final isCoordinator = profile.roles.contains('ROLE_COORDINATOR');

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Painel de Gestão',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Divider(indent: 16, endIndent: 16),
          // ✅ ADICIONADO: Link para Gestão de Competições
          // Apenas para Coordenadores.
          if (isCoordinator)
            ListTile(
              leading: const Icon(Icons.emoji_events_outlined),
              title: const Text('Gerir Competições'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.pushNamed(AppRoutes.competitions),
            ),
          if (isCoordinator)
            ListTile(
              leading: const Icon(Icons.directions_run),
              title: const Text('Gerir Atletas'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.pushNamed(AppRoutes.athletes),
            ),
          ListTile(
            leading: const Icon(Icons.sports_soccer),
            title: const Text('Consultar Desportos'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.pushNamed(AppRoutes.sports),
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Consultar Campi'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.pushNamed(AppRoutes.campuses),
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Consultar Cursos'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.pushNamed(AppRoutes.courses),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context, Profile profile) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Informações Gerais', style: textTheme.titleLarge),
                if (profile.athleteDetails != null)
                  IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    tooltip: 'Editar Meu Perfil de Atleta',
                    onPressed: () {
                      context.pushNamed(
                        AppRoutes.editAthlete,
                        pathParameters: {
                          'id': profile.athleteDetails!.id.toString()
                        },
                      );
                    },
                  ),
              ],
            ),
            const Divider(height: 24),
            _buildInfoRow(
              context,
              icon: Icons.badge_outlined,
              label: 'Matrícula',
              value: profile.registration,
            ),
            _buildInfoRow(
              context,
              icon: Icons.security_outlined,
              label: 'Perfis de Acesso',
              value: profile.roles.join(', '),
            ),
            if (profile.athleteDetails != null) ...[
              const Divider(height: 24),
              Text('Perfil de Atleta', style: textTheme.titleLarge),
              const SizedBox(height: 12),
              _buildInfoRow(
                context,
                icon: Icons.person_outline,
                label: 'Nome Completo',
                value: profile.athleteDetails!.fullName,
              ),
              if (profile.athleteDetails!.nickname != null)
                _buildInfoRow(
                  context,
                  icon: Icons.person_pin_outlined,
                  label: 'Alcunha',
                  value: profile.athleteDetails!.nickname!,
                ),
              if (profile.athleteDetails!.phone != null)
                _buildInfoRow(
                  context,
                  icon: Icons.phone_outlined,
                  label: 'Telefone',
                  value: profile.athleteDetails!.phone!,
                ),
              _buildInfoRow(
                context,
                icon: Icons.email_outlined,
                label: 'Email',
                value: profile.athleteDetails!.email,
              ),
              _buildInfoRow(
                context,
                icon: Icons.sports_soccer_outlined,
                label: 'É Treinador?',
                value: profile.athleteDetails!.isCoach ? 'Sim' : 'Não',
              ),
            ],
            if (profile.coordinatorProfile != null) ...[
              const Divider(height: 24),
              Text('Perfil de Coordenador', style: textTheme.titleLarge),
              const SizedBox(height: 12),
              _buildInfoRow(
                context,
                icon: Icons.person_outline,
                label: 'Nome',
                value: profile.coordinatorProfile!.name,
              ),
              _buildInfoRow(
                context,
                icon: Icons.email_outlined,
                label: 'Email',
                value: profile.coordinatorProfile!.email,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context,
      {required IconData icon, required String label, required String value}) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: colorScheme.primary, size: 24),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.toUpperCase(),
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(value, style: textTheme.bodyLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}