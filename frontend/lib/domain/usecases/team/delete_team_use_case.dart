// lib/domain/usecases/team/delete_team_use_case.dart
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/repositories/team_repository.dart';

class DeleteTeamUseCase {

  DeleteTeamUseCase(this._repository);
  final TeamRepository _repository;

  Future<Result<void>> call(int id) => _repository.delete(id);
}