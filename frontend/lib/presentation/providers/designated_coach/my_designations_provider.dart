import 'dart:async';

import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_summary.dart';
import 'package:playifs_frontend/domain/usecases/designated_coach/find_all_designated_coaches_use_case.dart';
import 'package:playifs_frontend/presentation/providers/profile/profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_designations_provider.g.dart';

@riverpod
class MyDesignations extends _$MyDesignations {
  final _useCase = locator<FindAllDesignatedCoachesUseCase>();

  @override
  Future<List<DesignatedCoachSummary>> build() async {
    final profile = await ref.watch(profileProvider.future);
    final athleteName = profile.athleteDetails?.fullName;

    if (athleteName == null) {
      return [];
    }

    // ✅ CORREÇÃO: Chamando o método '.execute()' explicitamente.
    final result = await _useCase.execute(athleteName: athleteName, size: 200);

    return result.when(
      success: (page) {
        final exactMatches = page.content.where((designation) => designation.athleteName == athleteName).toList();
        return exactMatches;
      },
      failure: (error) => throw error,
    );
  }
}