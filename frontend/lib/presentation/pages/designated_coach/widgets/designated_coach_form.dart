// Ficheiro: lib/presentation/pages/designated_coach/widgets/designated_coach_form.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_details.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_input.dart';
import 'package:playifs_frontend/presentation/providers/athlete/athlete_provider.dart';
import 'package:playifs_frontend/presentation/providers/course/courses_provider.dart';
import 'package:playifs_frontend/presentation/providers/designated_coach/designated_coach_form_provider.dart';
import 'package:playifs_frontend/presentation/providers/designated_coach/designated_coach_form_state.dart';
import 'package:playifs_frontend/presentation/providers/sport/sports_provider.dart';

class DesignatedCoachForm extends ConsumerStatefulWidget {
  const DesignatedCoachForm({
    super.key,
    required this.competitionId,
    this.existingDesignation,
  });

  final int competitionId;
  final DesignatedCoachDetails? existingDesignation;

  @override
  ConsumerState<DesignatedCoachForm> createState() => _DesignatedCoachFormState();
}

class _DesignatedCoachFormState extends ConsumerState<DesignatedCoachForm> {
  final _formKey = GlobalKey<FormState>();
  int? _selectedSportId;
  int? _selectedCourseId;
  int? _selectedCoachId;

  bool get _isEditMode => widget.existingDesignation != null;

  @override
  void initState() {
    super.initState();
    // Se estiver em modo de edição, pré-preenche os campos com os dados existentes.
    if (_isEditMode) {
      final details = widget.existingDesignation!;
      _selectedSportId = details.sport.id;
      _selectedCourseId = details.course.id;
      _selectedCoachId = details.coach.id;
    }
  }

  Future<void> _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      final input = DesignatedCoachInput(
        competitionId: widget.competitionId,
        sportId: _selectedSportId!,
        courseId: _selectedCourseId!,
        coachId: _selectedCoachId!,
      );
      final notifier = ref.read(designatedCoachFormNotifierProvider.notifier);
      final success = _isEditMode
          ? await notifier.update(input)
          : await notifier.define(input);

      if (success && mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Designação ${ _isEditMode ? 'atualizada' : 'criada' } com sucesso!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Ouve o estado do formulário para mostrar erros.
    ref.listen(designatedCoachFormNotifierProvider, (_, state) {
      state.whenOrNull(
        failure: (error) => showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Erro na Designação'),
            content: Text(error.toString()),
            actions: [
              TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('OK')),
            ],
          ),
        ),
      );
    });

    final formState = ref.watch(designatedCoachFormNotifierProvider);
    final sportsState = ref.watch(sportsNotifierProvider);
    final coursesState = ref.watch(coursesNotifierProvider);
    final athletesState = ref.watch(athleteListProvider);

    return Padding(
      padding: EdgeInsets.only(
        left: 16, right: 16, top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _isEditMode ? 'Editar Designação' : 'Designar Novo Técnico',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              sportsState.when(
                data: (page) => DropdownButtonFormField<int>(
                  initialValue: _selectedSportId,
                  hint: const Text('Selecione o Desporto'),
                  items: page.content.map((s) => DropdownMenuItem(value: s.id, child: Text(s.name))).toList(),
                  // Desabilita em modo de edição.
                  onChanged: _isEditMode ? null : (val) => setState(() => _selectedSportId = val),
                  validator: (val) => val == null ? 'Obrigatório' : null,
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, s) => const Text('Erro ao carregar desportos'),
              ),
              const SizedBox(height: 16),
              coursesState.when(
                data: (page) => DropdownButtonFormField<int>(
                  initialValue: _selectedCourseId,
                  hint: const Text('Selecione o Curso'),
                  items: page.content.map((c) => DropdownMenuItem(value: c.id, child: Text(c.name))).toList(),
                  // Desabilita em modo de edição.
                  onChanged: _isEditMode ? null : (val) => setState(() => _selectedCourseId = val),
                  validator: (val) => val == null ? 'Obrigatório' : null,
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, s) => const Text('Erro ao carregar cursos'),
              ),
              const SizedBox(height: 16),
              athletesState.when(
                data: (page) => DropdownButtonFormField<int>(
                  initialValue: _selectedCoachId,
                  hint: const Text('Selecione o Atleta (Técnico)'),
                  items: page.content.map((a) => DropdownMenuItem(value: a.id, child: Text(a.fullName))).toList(),
                  onChanged: (val) => setState(() => _selectedCoachId = val),
                  validator: (val) => val == null ? 'Obrigatório' : null,
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, s) => const Text('Erro ao carregar atletas'),
              ),
              const SizedBox(height: 24),
              formState.maybeWhen(
                loading: () => const Center(child: CircularProgressIndicator()),
                orElse: () => ElevatedButton(
                  onPressed: _submit,
                  child: Text(_isEditMode ? 'Atualizar Designação' : 'Designar Técnico'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}