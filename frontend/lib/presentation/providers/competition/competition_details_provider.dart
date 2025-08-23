// Ficheiro: lib/presentation/providers/competition/competition_details_provider.dart

import 'dart:async';

import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_details.dart';
import 'package:playifs_frontend/domain/usecases/competition/find_competition_by_id_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'competition_details_provider.g.dart';

@Riverpod(keepAlive: true)
class CompetitionDetailsNotifier extends _$CompetitionDetailsNotifier {
  late final FindCompetitionByIdUseCase _findByIdUseCase = locator<FindCompetitionByIdUseCase>();

  @override
  Future<CompetitionDetails> build(int competitionId) => _fetchDetails(competitionId);

  Future<CompetitionDetails> _fetchDetails(int id) async {
    final result = await _findByIdUseCase.execute(id);
    return result.when(
      success: (data) => data,
      failure: (error) => throw error,
    );
  }
}