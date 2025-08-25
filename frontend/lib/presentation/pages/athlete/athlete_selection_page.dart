import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/presentation/widgets/app_scaffold.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

import '../../providers/athlete/athlete_provider.dart';

class AthleteSelectionPage extends ConsumerStatefulWidget {
  const AthleteSelectionPage({super.key});

  @override
  ConsumerState<AthleteSelectionPage> createState() => _AthleteSelectionPageState();
}

class _AthleteSelectionPageState extends ConsumerState<AthleteSelectionPage> {
  final _scrollController = ScrollController();
  // Estado local para gerir os IDs dos atletas selecionados.
  final Set<int> _selectedAthleteIds = {};

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      ref.read(athleteListProvider.notifier).fetchNextPage();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _toggleSelection(int athleteId) {
    setState(() {
      if (_selectedAthleteIds.contains(athleteId)) {
        _selectedAthleteIds.remove(athleteId);
      } else {
        _selectedAthleteIds.add(athleteId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final athletesAsync = ref.watch(athleteListProvider);

    return AppScaffold(
      title: 'Selecionar Atletas',
      body: athletesAsync.when(
        data: (page) {
          if (page.content.isEmpty) {
            return const Center(child: Text('Nenhum atleta disponível.'));
          }
          return ListView.builder(
            controller: _scrollController,
            itemCount: page.content.length,
            itemBuilder: (context, index) {
              final athlete = page.content[index];
              final isSelected = _selectedAthleteIds.contains(athlete.id);
              return CheckboxListTile(
                title: Text(athlete.fullName),
                subtitle: Text(athlete.registration),
                value: isSelected,
                onChanged: (bool? value) {
                  if (value != null) {
                    _toggleSelection(athlete.id);
                  }
                },
              );
            },
          );
        },
        error: (error, stack) => ErrorDisplay(
          error: error,
          onRetry: () => ref.invalidate(athleteListProvider),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      fab: FloatingActionButton(
        // O botão só fica ativo se houver pelo menos um atleta selecionado.
        onPressed: _selectedAthleteIds.isNotEmpty
            ? () {
          // Retorna a lista de IDs para a tela anterior (`TeamDetailsPage`).
          context.pop(_selectedAthleteIds.toList());
        }
            : null,
        child: const Icon(Icons.check),
      ),
    );
  }
}