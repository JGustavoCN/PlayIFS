import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/presentation/providers/competition/elimination_bracket_provider.dart';
import 'package:playifs_frontend/presentation/providers/competition/group_stage_view_provider.dart';
import 'package:playifs_frontend/presentation/providers/competition/stage_providers_params.dart';

class GenerateStageButton extends ConsumerWidget {
  const GenerateStageButton.group({super.key, required this.params})
      : stageType = _StageType.group,
        label = 'Gerar Fase de Grupos';

  const GenerateStageButton.elimination({super.key, required this.params})
      : stageType = _StageType.elimination,
        label = 'Gerar Fase Eliminatória';

  final StageProvidersParams params;
  final _StageType stageType;
  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) => FilledButton.icon(
      icon: const Icon(Icons.casino_outlined),
      label: Text(label),
      onPressed: () async {
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Confirmar Ação'),
            content: Text('Deseja realmente $label?'),
            actions: [
              TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancelar')),
              FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Confirmar')),
            ],
          ),
        );

        if (confirmed != true) return;

        try {
          if (stageType == _StageType.group) {
            await ref.read(groupStageViewProvider(params).notifier).generateGroupStage();
            ref.invalidate(groupStageViewProvider(params));
          } else {
            await ref.read(eliminationBracketProvider(params).notifier).generateEliminationStage();
            ref.invalidate(eliminationBracketProvider(params));
          }

          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$label gerada com sucesso!')),
            );
          }
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Erro ao gerar $label: $e'),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      },
    );
}

enum _StageType { group, elimination }
