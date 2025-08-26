import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/core/network/exceptions.dart';
import 'package:playifs_frontend/presentation/pages/competition/widgets/generate_stage_button.dart';
import 'package:playifs_frontend/presentation/providers/competition/elimination_bracket_provider.dart';
import 'package:playifs_frontend/presentation/providers/competition/stage_providers_params.dart';
import 'package:playifs_frontend/presentation/providers/profile/profile_provider.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';
// Import dos widgets internos que foram movidos para cá para manter o exemplo conciso.
import 'package:playifs_frontend/domain/entities/competition/elimination_bracket.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';
import 'package:playifs_frontend/domain/entities/game/game_phase.dart';


class EliminationBracketTab extends ConsumerWidget {
  const EliminationBracketTab({super.key, required this.params});

  final StageProvidersParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // NOVO: Observar o estado do perfil do utilizador.
    final profileState = ref.watch(profileNotifierProvider);
    final isCoordinator = profileState.value?.roles.contains('ROLE_COORDINATOR') ?? false;

    final bracketState = ref.watch(eliminationBracketNotifierProvider(params));

    return bracketState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) {
        // CORREÇÃO: A lógica para mostrar o botão agora depende também da role do utilizador.
        if (error is ApiException && error.statusCode == 404) {
          if (isCoordinator) {
            return Center(
              child: GenerateStageButton(
                label: 'Gerar/Avançar Fase Eliminatória',
                onPressed: () => _confirmAndGenerateBracket(context, ref),
              ),
            );
          } else {
            // Mensagem para utilizadores comuns.
            return const Center(
                child: Text('O mata-mata ainda não foi gerado pelo coordenador.'));
          }
        }
        return ErrorDisplay(
          error: error,
          onRetry: () => ref.invalidate(eliminationBracketNotifierProvider(params)),
        );
      },
      data: (bracket) {
        if (bracket.rounds.isEmpty) {
          // Se não houver jogos, verificamos se o utilizador é coordenador para mostrar o botão
          if (isCoordinator) {
            return Center(
              child: GenerateStageButton(
                label: 'Gerar/Avançar Fase Eliminatória',
                onPressed: () => _confirmAndGenerateBracket(context, ref),
              ),
            );
          }
          return const Center(child: Text('O chaveamento ainda não foi gerado.'));
        }
        // Se houver jogos, renderiza o chaveamento e o botão de avançar para o coordenador
        return Column(
          children: [
            Expanded(child: _EliminationBracketView(bracket: bracket)),
            if(isCoordinator)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GenerateStageButton(
                  label: 'Avançar Fase',
                  onPressed: () => _confirmAndGenerateBracket(context, ref),
                ),
              ),
          ],
        );
      },
    );
  }

  Future<void> _confirmAndGenerateBracket(BuildContext context, WidgetRef ref) async {
    // ... (código do diálogo de confirmação permanece o mesmo) ...
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar Ação'),
        content: const Text(
            'Isto irá gerar ou avançar para a próxima fase do mata-mata. Confirma?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancelar')),
          FilledButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Confirmar')),
        ],
      ),
    );

    if (confirmed == true) {
      await ref
          .read(eliminationBracketNotifierProvider(params).notifier)
          .generateEliminationStage();
    }
  }
}

// Os widgets de visualização do chaveamento (_EliminationBracketView, _BracketRoundColumn, etc.)
// permanecem os mesmos, pois a sua única responsabilidade é exibir os dados.
// ... (código dos widgets de visualização aqui)
class _EliminationBracketView extends StatelessWidget {
  const _EliminationBracketView({required this.bracket});

  final EliminationBracket bracket;

  @override
  Widget build(BuildContext context) {
    // Ordena as fases para exibição correta (ex: QUARTAS -> SEMI -> FINAL)
    final sortedPhases = bracket.rounds.keys.toList()
      ..sort((a, b) => a.index.compareTo(b.index));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: sortedPhases.map((phase) {
            final games = bracket.rounds[phase]!;
            return _BracketRoundColumn(phase: phase, games: games);
          }).toList(),
        ),
      ),
    );
  }
}

class _BracketRoundColumn extends StatelessWidget {
  const _BracketRoundColumn({required this.phase, required this.games});

  final GamePhase phase;
  final List<GameDetails> games;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // Converte o nome do enum para um título legível
    final title = phase.name.replaceAll('_', ' ').toLowerCase().capitalize();

    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Text(title, style: textTheme.titleMedium),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: games.length,
              separatorBuilder: (_, __) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                return _BracketGameCard(game: games[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BracketGameCard extends StatelessWidget {
  const _BracketGameCard({required this.game});

  final GameDetails game;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    Widget buildTeamRow(String? teamName, int? score) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              teamName ?? 'A definir',
              style: textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            score?.toString() ?? '-',
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      );
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            buildTeamRow(game.teamA?.name, game.scoreTeamA),
            const Divider(height: 16),
            buildTeamRow(game.teamB?.name, game.scoreTeamB),
          ],
        ),
      ),
    );
  }
}

// Pequeno helper para capitalizar strings
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}