import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';
import 'package:playifs_frontend/domain/usecases/game/find_game_by_id_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_details_provider.g.dart';

@riverpod
class GameDetailsNotifier extends _$GameDetailsNotifier {
  late final FindGameByIdUseCase _findByIdUseCase;

  @override
  Future<GameDetails> build(int gameId) {
    _findByIdUseCase = locator<FindGameByIdUseCase>();
    return _fetchDetails(gameId);
  }

  Future<GameDetails> _fetchDetails(int id) async {
    final result = await _findByIdUseCase.execute(id);
    return result.when(
      success: (data) => data,
      failure: (error) => throw error,
    );
  }
}