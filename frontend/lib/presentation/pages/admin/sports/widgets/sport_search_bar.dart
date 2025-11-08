// Ficheiro: lib/presentation/pages/admin/sports/widgets/sport_search_bar.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/presentation/providers/sport/sports_provider.dart';

class SportSearchBar extends ConsumerStatefulWidget {
  const SportSearchBar({super.key});

  @override
  ConsumerState<SportSearchBar> createState() => _SportSearchBarState();
}

class _SportSearchBarState extends ConsumerState<SportSearchBar> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submitSearch(String query) {
    // Aciona o método de busca no nosso notifier.
    ref.read(sportsProvider.notifier).searchByName(query);
  }

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: 'Buscar Desporto',
          hintText: 'Digite o nome do desporto...',
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _submitSearch(_controller.text),
          ),
        ),
        onSubmitted: _submitSearch,
      ),
    );
}