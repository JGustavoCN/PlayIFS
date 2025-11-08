// Ficheiro: lib/presentation/pages/admin/courses/widgets/courses_list_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/domain/entities/course/course_summary.dart';
// ✅ CORREÇÃO: Importando a nossa entidade 'Page' com um prefixo 'domain'.
import 'package:playifs_frontend/domain/entities/shared/page.dart' as domain;
import 'package:playifs_frontend/presentation/providers/course/courses_provider.dart';

class CoursesListView extends ConsumerStatefulWidget {
  const CoursesListView({super.key, required this.coursesPage});

  // ✅ CORREÇÃO: Usando o tipo prefixado 'domain.Page'.
  final domain.Page<CourseSummary> coursesPage;

  @override
  ConsumerState<CoursesListView> createState() => _CoursesListViewState();
}

class _CoursesListViewState extends ConsumerState<CoursesListView> {
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
      ref.read(coursesProvider.notifier).loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final courses = widget.coursesPage.content;
    final isLoadingNextPage = ref.watch(
      coursesProvider.select((state) => state.isLoading && state.hasValue),
    );

    if (courses.isEmpty) {
      return const Center(child: Text('Nenhum curso encontrado.'));
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: courses.length + (isLoadingNextPage ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == courses.length) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          );
        }
        final course = courses[index];
        return ListTile(
          leading: CircleAvatar(child: Text(course.id.toString())),
          title: Text(course.name),
          subtitle: Text('${course.campusName} - ${course.level}'),
          onTap: () {
            // TODO: Navegar para a página de detalhes do curso.
          },
        );
      },
    );
  }
}