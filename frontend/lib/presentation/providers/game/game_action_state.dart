import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';

part 'game_action_state.freezed.dart';

@freezed
abstract class GameActionState with _$GameActionState {
  const factory GameActionState.initial() = _Initial;
  const factory GameActionState.loading() = _Loading;
  const factory GameActionState.success(GameDetails game) = _Success;
  const factory GameActionState.deleteSuccess() = _DeleteSuccess;
  const factory GameActionState.failure(Exception error) = _Failure;
}