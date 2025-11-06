import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/core/network/exceptions.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';
import 'package:playifs_frontend/domain/entities/game/game_result_input.dart';
import 'package:playifs_frontend/presentation/providers/game/game_action_provider.dart';
import 'package:playifs_frontend/presentation/providers/game/game_action_state.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

class GameResultFormWidget extends ConsumerStatefulWidget {
  const GameResultFormWidget({
    super.key,
    required this.game,
  });

  final GameDetails game;

  @override
  ConsumerState<GameResultFormWidget> createState() =>
      _GameResultFormWidgetState();
}

class _GameResultFormWidgetState extends ConsumerState<GameResultFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _scoreAController;
  late final TextEditingController _scoreBController;

  Map<String, String> _fieldErrors = {};

  @override
  void initState() {
    super.initState();
    _scoreAController =
        TextEditingController(text: widget.game.scoreTeamA?.toString() ?? '0');
    _scoreBController =
        TextEditingController(text: widget.game.scoreTeamB?.toString() ?? '0');
  }

  @override
  void dispose() {
    _scoreAController.dispose();
    _scoreBController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<GameActionState>(gameActionNotifierProvider, (previous, next) {
      next.maybeWhen(
        success: (_) {
          if (mounted) Navigator.of(context).pop();
        },
        failure: (error) {
          if (error is ValidationException) {
            setState(() {
              _fieldErrors = {
                for (var e in error.errorDetails.errors) e.fieldName: e.message
              };
            });
          } else {
            if (mounted) Navigator.of(context).pop();
          }
          ref.read(gameActionNotifierProvider.notifier).reset();
        },
        orElse: () {
          if (_fieldErrors.isNotEmpty) {
            setState(() {
              _fieldErrors = {};
            });
          }
        },
      );
    });

    final actionState = ref.watch(gameActionNotifierProvider);

    final isUpdating = actionState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 16.0,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Registrar Placar Final',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _buildScoreField(
                    widget.game.teamA?.name ?? 'Equipa A',
                    _scoreAController,
                    'scoreTeamA',
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildScoreField(
                    widget.game.teamB?.name ?? 'Equipa B',
                    _scoreBController,
                    'scoreTeamB',
                  ),
                ),
              ],
            ),
            actionState.maybeWhen(
              failure: (error) {
                if (error is! ValidationException) {
                  return ErrorDisplay(
                    error: error,
                    onRetry: () =>
                        ref.read(gameActionNotifierProvider.notifier).reset(),
                  );
                }
                return const SizedBox.shrink();
              },
              orElse: () => const SizedBox.shrink(),
            ),
            if (_fieldErrors.containsKey('form')) ...[
              const SizedBox(height: 8),
              ErrorDisplay(
                error: _fieldErrors['form']!,
                onRetry: () =>
                    ref.read(gameActionNotifierProvider.notifier).reset(),
              ),
            ],
            const SizedBox(height: 20),
            FilledButton(
              onPressed: !isUpdating ? _submit : null,
              child: isUpdating
                  ? const Center(
                  child: SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(strokeWidth: 2)))
                  : const Text('Confirmar Resultado'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreField(
      String label, TextEditingController controller, String fieldName) =>
      TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          errorText: _fieldErrors[fieldName],
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'O placar é obrigatório';
          }
          if (int.tryParse(value)! < 0) {
            return 'Placar deve ser não negativo';
          }
          return null;
        },
      );

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final input = GameResultInput(
        scoreTeamA: int.parse(_scoreAController.text),
        scoreTeamB: int.parse(_scoreBController.text),
      );

      await ref
          .read(gameActionNotifierProvider.notifier)
          .updateResult(widget.game.id, input);

      if (!mounted) return;

      Navigator.of(context).pop();
    }
  }
}