import 'package:freezed_annotation/freezed_annotation.dart';

part 'stage_providers_params.freezed.dart';

/// Parameters required by the stage-related providers.
@freezed
abstract class StageProvidersParams with _$StageProvidersParams {
  /// Default constructor for the parameters.
  const factory StageProvidersParams({
    required int competitionId,
    required int sportId,
  }) = _StageProvidersParams;
}