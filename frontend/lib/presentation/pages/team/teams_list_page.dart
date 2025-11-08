import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/routing/app_routes.dart';
import 'package:playifs_frontend/presentation/providers/team/teams_provider.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

class TeamsListPage extends ConsumerStatefulWidget {
  const TeamsListPage({super.key, this.competitionId});
  final int? competitionId;

  @override
  ConsumerState<TeamsListPage> createState() => _TeamsListPageState();
}

class _TeamsListPageState extends ConsumerState<TeamsListPage> {
  final _scrollController = ScrollController();
  Timer? _debounce;

  bool _isSelectionMode = false;
  final Set<int> _selectedTeamIds = {};

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_isSelectionMode && _scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      // ✅ MELHORIA: Tratamento de erro explícito para a paginação.
      try {
        ref.read(teamsProvider(competitionId: widget.competitionId).notifier).fetchNextPage();
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro ao carregar mais equipas: $e')),
          );
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _toggleSelection(int teamId) {
    setState(() {
      if (_selectedTeamIds.contains(teamId)) {
        _selectedTeamIds.remove(teamId);
        if (_selectedTeamIds.isEmpty) _isSelectionMode = false;
      } else {
        _selectedTeamIds.add(teamId);
      }
    });
  }

  void _enterSelectionMode(int teamId) {
    setState(() {
      _isSelectionMode = true;
      _selectedTeamIds.add(teamId);
    });
  }

  void _exitSelectionMode() {
    setState(() {
      _isSelectionMode = false;
      _selectedTeamIds.clear();
    });
  }

  Future<void> _deleteSelectedTeams() async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Apagar ${_selectedTeamIds.length} equipas?'),
        content: const Text('Esta ação não pode ser desfeita.'),
        actions: [
          TextButton(onPressed: () => context.pop(false), child: const Text('Cancelar')),
          TextButton(onPressed: () => context.pop(true), style: TextButton.styleFrom(foregroundColor: Colors.red), child: const Text('Apagar')),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      try {
        await ref.read(teamsProvider(competitionId: widget.competitionId).notifier).batchDeleteTeams(_selectedTeamIds.toList());
        _exitSelectionMode();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao apagar equipas: $e')),
        );
      }
    }
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(teamsProvider(competitionId: widget.competitionId).notifier).search(name: query);
    });
  }

  AppBar _buildAppBar(BuildContext context) {
    if (_isSelectionMode) {
      return AppBar(
        title: Text('${_selectedTeamIds.length} selecionadas'),
        leading: IconButton(icon: const Icon(Icons.close), onPressed: _exitSelectionMode),
        actions: [IconButton(icon: const Icon(Icons.delete), onPressed: _deleteSelectedTeams)],
      );
    } else {
      return AppBar(
        title: const Text('Equipas'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              onChanged: _onSearchChanged,
              decoration: const InputDecoration(
                labelText: 'Buscar por nome da equipa',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final teamsAsync = ref.watch(teamsProvider(competitionId: widget.competitionId));

    return Scaffold(
      appBar: _buildAppBar(context),
      body: teamsAsync.when(
        data: (page) {
          if (page.content.isEmpty && !_isSelectionMode) {
            return const Center(child: Text('Nenhuma equipa encontrada.'));
          }
          return RefreshIndicator(
            onRefresh: () => ref.refresh(teamsProvider(competitionId: widget.competitionId).future),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: page.content.length,
              itemBuilder: (context, index) {
                final team = page.content[index];
                final isSelected = _selectedTeamIds.contains(team.id);
                return ListTile(
                  onTap: () {
                    if (_isSelectionMode) {
                      _toggleSelection(team.id);
                    } else {
                      context.pushNamed(AppRoutes.teamDetails, pathParameters: {'teamId': team.id.toString()});
                    }
                  },
                  onLongPress: () {
                    if (!_isSelectionMode) _enterSelectionMode(team.id);
                  },
                  leading: _isSelectionMode
                      ? Checkbox(value: isSelected, onChanged: (_) => _toggleSelection(team.id))
                      : const Icon(Icons.groups_outlined),
                  title: Text(team.name),
                );
              },
            ),
          );
        },
        error: (error, stackTrace) => ErrorDisplay(
          error: error,
          // ✅ MELHORIA: Corrigida a invalidação do provider de família.
          onRetry: () => ref.invalidate(teamsProvider(competitionId: widget.competitionId)),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: null,
    );
  }
}