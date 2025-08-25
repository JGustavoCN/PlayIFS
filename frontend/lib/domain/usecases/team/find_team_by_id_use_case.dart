// lib/domain/usecases/team/find_team_by_id_use_case.dart
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/team/team_details.dart';
import 'package:playifs_frontend/domain/repositories/team_repository.dart';

class FindTeamByIdUseCase {

  FindTeamByIdUseCase(this._repository);
  final TeamRepository _repository;

  Future<Result<TeamDetails>> call(int id) => _repository.findById(id);
}