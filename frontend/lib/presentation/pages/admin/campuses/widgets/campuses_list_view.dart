// Ficheiro: lib/presentation/pages/admin/campuses/widgets/campuses_list_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/domain/entities/campus/campus_summary.dart';
// ✅ CORREÇÃO: Importando a nossa entidade 'Page' com um prefixo 'domain'.
import 'package:playifs_frontend/domain/entities/shared/page.dart' as domain;
import 'package:playifs_frontend/presentation/providers/campus/campuses_provider.dart';

class CampusesListView extends ConsumerStatefulWidget {
  const CampusesListView({super.key, required this.campusesPage});

  // ✅ CORREÇÃO: Usando o tipo prefixado 'domain.Page'.
  final domain.Page<CampusSummary> campusesPage;

  @override
  ConsumerState<CampusesListView> createState() => _CampusesListViewState();
}

class _CampusesListViewState extends ConsumerState<CampusesListView> {
  // ... (o resto do código permanece o mesmo)
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
      ref.read(campusesNotifierProvider.notifier).loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final campuses = widget.campusesPage.content;
    final isLoadingNextPage = ref.watch(
      campusesNotifierProvider.select((state) => state.isLoading && state.hasValue),
    );

    if (campuses.isEmpty) {
      return const Center(child: Text('Nenhum campus encontrado.'));
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: campuses.length + (isLoadingNextPage ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == campuses.length) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          );
        }
        final campus = campuses[index];
        return ListTile(
          leading: CircleAvatar(child: Text(campus.id.toString())),
          title: Text(campus.name),
          onTap: () {
            // TODO: Navegar para a página de detalhes do campus.
          },
        );
      },
    );
  }
}