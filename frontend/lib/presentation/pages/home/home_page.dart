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
            // O card de navegação para a lista de atletas (geralmente para coordenadores)
            // pode ser tornado condicional também, se necessário.
            Card(
              child: ListTile(
                leading: const Icon(Icons.directions_run),
                title: const Text('Gestão de Atletas'),
                subtitle: const Text('Visualizar e gerir perfis de atletas'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.pushNamed(AppRoutes.athletes),
              ),
            ),
          ],
        ),
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
                // ✅ 1. BOTÃO DE EDIÇÃO CONDICIONAL
                // Só aparece se o utilizador tiver um perfil de atleta.
                if (profile.athleteDetails != null)
                  IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    tooltip: 'Editar Meu Perfil de Atleta',
                    onPressed: () {
                      // ✅ 2. NAVEGAÇÃO PARA A TELA DE EDIÇÃO
                      // Usa o ID do atleta que está no próprio perfil.
                      context.pushNamed(
                        AppRoutes.editAthlete,
                        pathParameters: {'id': profile.athleteDetails!.id.toString()},
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