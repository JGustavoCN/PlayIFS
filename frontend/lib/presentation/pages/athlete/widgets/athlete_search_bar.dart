// lib/presentation/pages/athlete/widgets/athlete_search_bar.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/presentation/providers/athlete/athlete_provider.dart';

class AthleteSearchBar extends ConsumerStatefulWidget {
  const AthleteSearchBar({super.key});

  @override
  ConsumerState<AthleteSearchBar> createState() => _AthleteSearchBarState();
}

class _AthleteSearchBarState extends ConsumerState<AthleteSearchBar> {
  final _textController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _textController.text = ref.read(athleteSearchQueryProvider);
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(athleteSearchQueryProvider.notifier).setSearchQuery(query);
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: TextField(
      // ✅ CHAVE ADICIONADA PARA O TESTE
      key: const ValueKey('athlete_search_field'),
      controller: _textController,
      onChanged: _onSearchChanged,
      decoration: InputDecoration(
        hintText: 'Pesquisar por nome...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: EdgeInsets.zero,
      ),
    ),
  );
}