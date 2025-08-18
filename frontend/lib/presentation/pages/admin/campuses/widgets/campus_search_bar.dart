// Ficheiro: lib/presentation/pages/admin/campuses/widgets/campus_search_bar.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/presentation/providers/campus/campuses_provider.dart';

class CampusSearchBar extends ConsumerStatefulWidget {
  const CampusSearchBar({super.key});

  @override
  ConsumerState<CampusSearchBar> createState() => _CampusSearchBarState();
}

class _CampusSearchBarState extends ConsumerState<CampusSearchBar> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submitSearch(String query) {
    // Aciona o método de busca no notifier de campi.
    ref.read(campusesNotifierProvider.notifier).searchByName(query);
  }

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: 'Buscar Campus',
          hintText: 'Digite o nome do campus...',
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _submitSearch(_controller.text),
          ),
        ),
        onSubmitted: _submitSearch,
      ),
    );
}