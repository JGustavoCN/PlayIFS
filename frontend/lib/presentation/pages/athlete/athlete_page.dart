import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/routing/app_routes.dart';
import 'package:playifs_frontend/presentation/providers/athlete/athlete_provider.dart';
import 'package:playifs_frontend/presentation/providers/auth/auth_provider.dart';
import 'package:playifs_frontend/presentation/providers/auth/auth_state.dart';
import 'widgets/athlete_search_bar.dart';
import 'widgets/athletes_list.dart';

class AthletePage extends ConsumerStatefulWidget {
  const AthletePage({super.key});

  @override
  ConsumerState<AthletePage> createState() => _AthletePageState();
}

class _AthletePageState extends ConsumerState<AthletePage> {
  // ✅ 1. O ESTADO DE SELEÇÃO AGORA VIVE AQUI.
  final Set<int> _selectedAthleteIds = {};
  bool get _isSelectionMode => _selectedAthleteIds.isNotEmpty;

  // ✅ 2. FUNÇÃO PARA ATUALIZAR O ESTADO DE SELEÇÃO.
  void _onSelectionChanged(Set<int> newSelection) {
    setState(() {
      _selectedAthleteIds.clear();
      _selectedAthleteIds.addAll(newSelection);
    });
  }

  // ✅ 3. LÓGICA DE EXCLUSÃO EM MASSA AGORA VIVE AQUI.
  Future<void> _executeBatchDelete() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirmar Exclusão'),
        content: Text('Tem a certeza de que deseja apagar os ${_selectedAthleteIds.length} atletas selecionados?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancelar')),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Apagar')),
        ],
      ),
    );

    if (confirm ?? false) {
      try {
        await ref.read(athleteListProvider.notifier).batchDeleteAthletes(_selectedAthleteIds.toList());
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Atletas apagados com sucesso!'), backgroundColor: Colors.green),
          );
          setState(() => _selectedAthleteIds.clear());
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro ao apagar: ${e.toString()}'), backgroundColor: Theme.of(context).colorScheme.error),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final isCoordinator = authState.maybeWhen(
      data: (state) => state.maybeWhen(
        authenticated: (profile) => profile.roles.contains('ROLE_COORDINATOR'),
        orElse: () => false,
      ),
      orElse: () => false,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(_isSelectionMode ? '${_selectedAthleteIds.length} selecionados' : 'Gestão de Atletas'),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AthleteSearchBar(),
        ),
        actions: [
          if (isCoordinator && !_isSelectionMode)
            IconButton(
              icon: const Icon(Icons.group_add),
              onPressed: () => context.pushNamed(AppRoutes.batchCreateAthlete),
              tooltip: 'Adicionar em Massa',
            ),
        ],
      ),
      body: AthletesList(
        isCoordinator: isCoordinator,
        // ✅ 4. PASSA O ESTADO E OS CALLBACKS PARA O WIDGET FILHO.
        selectedIds: _selectedAthleteIds,
        onSelectionChanged: _onSelectionChanged,
      ),
      // ✅ 5. RENDERIZAÇÃO CONDICIONAL PARA EVITAR SOBREPOSIÇÃO.
      floatingActionButton: isCoordinator && !_isSelectionMode
          ? FloatingActionButton(
        onPressed: () => context.pushNamed(AppRoutes.createAthlete),
        tooltip: 'Adicionar Novo Atleta',
        child: const Icon(Icons.add),
      )
          : null,
      bottomNavigationBar: isCoordinator && _isSelectionMode
          ? BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => setState(() => _selectedAthleteIds.clear()),
              child: const Text('Cancelar'),
            ),
            IconButton(
              icon: Icon(Icons.delete_sweep_outlined, color: Theme.of(context).colorScheme.error),
              onPressed: _executeBatchDelete,
              tooltip: 'Apagar Selecionados',
            ),
          ],
        ),
      )
          : null,
    );
  }
}