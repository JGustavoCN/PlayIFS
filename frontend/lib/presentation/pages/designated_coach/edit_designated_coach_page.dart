// Ficheiro: lib/presentation/pages/designated_coach/edit_designated_coach_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/presentation/providers/designated_coach/designated_coach_details_provider.dart';
import 'package:playifs_frontend/presentation/widgets/app_scaffold.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';
import 'widgets/designated_coach_form.dart';

class EditDesignatedCoachPage extends ConsumerWidget {
  const EditDesignatedCoachPage({super.key, required this.designationId});
  final int designationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsState = ref.watch(designatedCoachDetailsProvider(designationId));

    return AppScaffold(
      title: 'Editar Designação',
      body: detailsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => ErrorDisplay(error: err),
        data: (details) => DesignatedCoachForm(
          competitionId: details.competition.id,
          existingDesignation: details,
        ),
      ),
    );
  }
}