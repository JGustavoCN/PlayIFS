// Ficheiro: lib/presentation/providers/designated_coach/designated_coach_form_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'designated_coach_form_state.freezed.dart';

@freezed
abstract class DesignatedCoachFormState with _$DesignatedCoachFormState {
  const factory DesignatedCoachFormState.initial() = _Initial;
  const factory DesignatedCoachFormState.loading() = _Loading;
  const factory DesignatedCoachFormState.success() = _Success;
  const factory DesignatedCoachFormState.failure(Exception error) = _Failure;
}