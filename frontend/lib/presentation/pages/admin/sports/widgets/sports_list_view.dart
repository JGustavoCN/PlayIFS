// Ficheiro: lib/presentation/pages/admin/sports/widgets/sports_list_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ✅ CORREÇÃO: Importando a nossa entidade 'Page' com um prefixo 'domain'.
import 'package:playifs_frontend/domain/entities/shared/page.dart' as domain;
import 'package:playifs_frontend/domain/entities/sport/sport_summary.dart';
import 'package:playifs_frontend/presentation/providers/sport/sports_provider.dart';

class SportsListView extends ConsumerStatefulWidget {
  const SportsListView({super.key, required this.sportsPage});

  // ✅ CORREÇÃO: Usando o tipo prefixado 'domain.Page'.
  final domain.Page<SportSummary> sportsPage;

  @override
  ConsumerState<SportsListView> createState() => _SportsListViewState();
}

class _SportsListViewState extends ConsumerState<SportsListView> {
  final _scrollController = ScrollController();

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

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // Quando o utilizador chega perto do fim da lista, carrega a próxima página.
      ref.read(sportsNotifierProvider.notifier).loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final sports = widget.sportsPage.content;
    final isLoadingNextPage = ref.watch(
      sportsNotifierProvider.select((state) => state.isLoading && state.hasValue),
    );

    if (sports.isEmpty) {
      return const Center(child: Text('Nenhum desporto encontrado.'));
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: sports.length + (isLoadingNextPage ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == sports.length) {
          // Mostra um indicador de carregamento no fundo da lista.
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          );
        }
        final sport = sports[index];
        return ListTile(
          leading: CircleAvatar(child: Text(sport.id.toString())),
          title: Text(sport.name),
          onTap: () {
            // TODO: Navegar para a página de detalhes do desporto.
          },
        );
      },
    );
  }
}