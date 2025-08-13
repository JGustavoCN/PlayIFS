// Ficheiro: lib/presentation/pages/home/home_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        title: const Text('Meu Perfil'),
        actions: [
          const ThemeToggleButton(),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sair',
            onPressed: () {
              ref.read(authProvider.notifier).logout();
            },
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
        data: (profile) {
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildProfileCard(context, profile),
              // Adicione outros widgets do dashboard aqui
            ],
          );
        },
      ),
    );
  }

  // Widget principal para o card de perfil.
  Widget _buildProfileCard(BuildContext context, Profile profile) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Informações Gerais', style: textTheme.titleLarge),
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

            // Renderização condicional para o perfil de atleta
            if (profile.athleteProfile != null) ...[
              const Divider(height: 24),
              Text('Perfil de Atleta', style: textTheme.titleLarge),
              const SizedBox(height: 12),
              _buildInfoRow(
                context,
                icon: Icons.person_outline,
                label: 'Nome Completo',
                value: profile.athleteProfile!.fullName,
              ),
              _buildInfoRow(
                context,
                icon: Icons.email_outlined,
                label: 'Email',
                value: profile.athleteProfile!.email,
              ),
            ],

            // Renderização condicional para o perfil de coordenador
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
            ],
          ],
        ),
      ),
    );
  }

  /// **MÉTODO AUXILIAR ATUALIZADO**
  /// Constrói uma linha de informação com um ícone, um rótulo e um valor.
  Widget _buildInfoRow(BuildContext context,
      {required IconData icon, required String label, required String value}) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ícone
          Icon(
            icon,
            color: colorScheme.primary,
            size: 24,
          ),
          const SizedBox(width: 16.0),
          // Coluna com o texto para permitir o alinhamento vertical
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // O RÓTULO (SUBTÍTULO)
                Text(
                  label.toUpperCase(),
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 4.0),
                // O VALOR (INFORMAÇÃO)
                Text(
                  value,
                  style: textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
