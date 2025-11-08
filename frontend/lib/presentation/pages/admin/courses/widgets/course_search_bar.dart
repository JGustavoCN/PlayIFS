// Ficheiro: lib/presentation/pages/admin/courses/widgets/course_search_bar.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/presentation/providers/campus/campuses_provider.dart';
// ✅ CORREÇÃO: O nome do provider foi atualizado após a refatoração.
import 'package:playifs_frontend/presentation/providers/config/app_config_provider.dart';
import 'package:playifs_frontend/presentation/providers/course/courses_provider.dart';

class CourseSearchBar extends ConsumerStatefulWidget {
  const CourseSearchBar({super.key});

  @override
  ConsumerState<CourseSearchBar> createState() => _CourseSearchBarState();
}

class _CourseSearchBarState extends ConsumerState<CourseSearchBar> {
  final _nameController = TextEditingController();
  int? _selectedCampusId;
  String? _selectedLevel;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submitSearch() {
    final filters = <String, dynamic>{
      'name': _nameController.text,
      'campusId': _selectedCampusId,
      'level': _selectedLevel,
    };
    filters.removeWhere(
            (key, value) => value == null || (value is String && value.isEmpty));

    ref.read(coursesProvider.notifier).searchWithFilters(filters);
  }

  @override
  Widget build(BuildContext context) {
    // ✅ CORREÇÃO: Usando o nome correto do provider.
    final appConfigState = ref.watch(appConfigProvider);
    final campusesState = ref.watch(campusesProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Nome do Curso'),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: campusesState.when(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, s) => const Text('Erro ao carregar campi'),
                  data: (page) => DropdownButtonFormField<int>(
                    // ✅ CORREÇÃO: 'value' foi depreciado, mas neste contexto de
                    //    StatefulWidget, ele ainda é a forma correta de controlar
                    //    o valor exibido. O lint pode ser ignorado ou ajustado
                    //    se usássemos um FormController. Por agora, mantemos 'value'.
                    initialValue: _selectedCampusId,
                    hint: const Text('Campus'),
                    onChanged: (value) =>
                        setState(() => _selectedCampusId = value),
                    items: page.content
                        .map((campus) => DropdownMenuItem(
                      value: campus.id,
                      child: Text(campus.name),
                    ))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: appConfigState.when(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, s) => const Text('Erro ao carregar níveis'),
                  data: (config) => DropdownButtonFormField<String>(
                    initialValue: _selectedLevel,
                    hint: const Text('Nível'),
                    onChanged: (value) =>
                        setState(() => _selectedLevel = value),
                    items: config.courseLevels
                        .map((level) => DropdownMenuItem(
                      value: level,
                      child: Text(level),
                    ))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.search),
            label: const Text('Buscar'),
            onPressed: _submitSearch,
          ),
        ],
      ),
    );
  }
}