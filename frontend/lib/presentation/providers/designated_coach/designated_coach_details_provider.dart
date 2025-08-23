// Ficheiro: lib/presentation/providers/designated_coach/designated_coach_details_provider.dart

import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_details.dart';
import 'package:playifs_frontend/domain/usecases/designated_coach/find_designated_coach_by_id_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'designated_coach_details_provider.g.dart';

@Riverpod(keepAlive: true)
// ✅ CORREÇÃO: Renomeado de 'DesignatedCoachDetails' para 'DesignatedCoachDetailsNotifier'.
class DesignatedCoachDetailsNotifier extends _$DesignatedCoachDetailsNotifier {
  late final FindDesignatedCoachByIdUseCase _findByIdUseCase =
  locator<FindDesignatedCoachByIdUseCase>();

  Future<DesignatedCoachDetails> build(int designationId) => _fetchDetails(designationId);

  Future<DesignatedCoachDetails> _fetchDetails(int id) async {
    final result = await _findByIdUseCase.execute(id);
    return result.when(
      success: (data) => data,
      failure: (error) => throw error,
    );
  }
}