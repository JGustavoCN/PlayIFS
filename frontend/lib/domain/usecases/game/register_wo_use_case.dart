import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';
import 'package:playifs_frontend/domain/entities/game/game_wo_input.dart';
import 'package:playifs_frontend/domain/repositories/game_repository.dart';

class RegisterWoUseCase {
  RegisterWoUseCase(this._repository);
  final GameRepository _repository;

  Future<Result<GameDetails>> execute(int gameId, GameWoInput input) => _repository.registerWo(gameId, input);
}