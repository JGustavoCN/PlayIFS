import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/routing/app_routes.dart';
import 'package:playifs_frontend/presentation/providers/athlete/athlete_provider.dart';

class AthletesList extends ConsumerStatefulWidget {

  const AthletesList({
    super.key,
    required this.isCoordinator,
    required this.selectedIds,
    required this.onSelectionChanged,
  });

  final bool isCoordinator;
  final Set<int> selectedIds;
  final ValueChanged<Set<int>> onSelectionChanged;

  @override
  ConsumerState<AthletesList> createState() => _AthletesListState();
}

class _AthletesListState extends ConsumerState<AthletesList> {
  final _scrollController = ScrollController();

  bool get _isSelectionMode => widget.selectedIds.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final athletesAsync = ref.watch(athleteListProvider);

    return athletesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ocorreu um erro: ${err.toString()}'),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(athleteListProvider);
              },
              child: const Text('Tentar Novamente'),
            ),
          ],
        ),
      ),
      data: (page) {
        if (page.content.isEmpty && !_isSelectionMode) {
          return const Center(child: Text('Nenhum atleta encontrado.'));
        }

        return RefreshIndicator(
          onRefresh: () async {
            widget.onSelectionChanged({});
            return ref.refresh(athleteListProvider.future);
          },
          child: ListView.builder(
            controller: _scrollController,
            itemCount: page.content.length + 1,
            itemBuilder: (context, index) {
              if (index == page.content.length) {
                if (page.number < page.totalPages - 1) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return const SizedBox.shrink();
              }
              final athlete = page.content[index];
              final isSelected = widget.selectedIds.contains(athlete.id);

              return ListTile(
                tileColor: isSelected
                    ? Theme.of(context).colorScheme.primaryContainer
                    : null,
                leading: _isSelectionMode
                    ? Checkbox(
                  value: isSelected,
                  onChanged: (_) => _toggleSelection(athlete.id),
                )
                    : null,
                title: Text(athlete.fullName),
                subtitle: Text(athlete.registration),
                onTap: () {
                  if (_isSelectionMode) {
                    _toggleSelection(athlete.id);
                  } else if (widget.isCoordinator) {
                    context.pushNamed(
                      AppRoutes.editAthlete,
                      pathParameters: {'id': athlete.id.toString()},
                    );
                  }
                },
                onLongPress: () {
                  if (widget.isCoordinator) {
                    _toggleSelection(athlete.id);
                  }
                },
              );
            },
          ),
        );
      },
    );
  }

  void _toggleSelection(int athleteId) {
    final newSelection = Set<int>.from(widget.selectedIds);
    if (newSelection.contains(athleteId)) {
      newSelection.remove(athleteId);
    } else {
      newSelection.add(athleteId);
    }
    widget.onSelectionChanged(newSelection);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      if (ref.read(athleteListProvider).hasValue) {
        _fetchNextPage();
      }
    }
  }

  Future<void> _fetchNextPage() async {
    try {
      await ref.read(athleteListProvider.notifier).fetchNextPage();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao carregar mais atletas: ${e.toString()}'),
            action: SnackBarAction(
              label: 'TENTAR NOVAMENTE',
              onPressed: _fetchNextPage,
            ),
          ),
        );
      }
    }
  }
}
