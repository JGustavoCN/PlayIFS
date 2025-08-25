// lib/domain/usecases/team/find_all_teams_use_case.dart
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/entities/team/team_summary.dart';
import 'package:playifs_frontend/domain/repositories/team_repository.dart';

class FindAllTeamsUseCase {

  FindAllTeamsUseCase(this._repository);
  final TeamRepository _repository;

  Future<Result<Page<TeamSummary>>> call({
    int page = 0,
    int size = 10,
    String? sort,
    Map<String, dynamic>? filters,
  }) =>
      _repository.findAll(
        page: page,
        size: size,
        sort: sort,
        filters: filters,
      );
}