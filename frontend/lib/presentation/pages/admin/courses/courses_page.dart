// Ficheiro: lib/presentation/pages/admin/courses/courses_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/presentation/providers/course/courses_provider.dart';
import 'package:playifs_frontend/presentation/widgets/app_scaffold.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

import 'widgets/course_search_bar.dart';
import 'widgets/courses_list_view.dart';

class CoursesPage extends ConsumerWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesState = ref.watch(coursesProvider);

    return AppScaffold(
      title: 'Gestão de Cursos',
      body: Column(
        children: [
          const CourseSearchBar(),
          const Divider(),
          Expanded(
            child: coursesState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => ErrorDisplay(
                error: error,
                onRetry: () => ref.invalidate(coursesProvider),
              ),
              data: (coursesPage) => CoursesListView(coursesPage: coursesPage),
            ),
          ),
        ],
      ),
      fab: FloatingActionButton(
        onPressed: () {
          // TODO: Navegar para a página de criação de curso.
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}