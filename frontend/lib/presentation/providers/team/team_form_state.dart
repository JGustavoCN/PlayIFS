import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/domain/entities/team/team_details.dart';

part 'team_form_state.freezed.dart';

@freezed
abstract class TeamFormState with _$TeamFormState {
  const factory TeamFormState({
    /// O nome da equipa, controlado pelo campo de texto.
    required String name,
    /// Mantém os dados da equipa original no modo de edição.
    TeamDetails? initialTeam,
    /// Indica se o formulário é válido e pode ser submetido.
    @Default(false) bool isFormValid,
  }) = _TeamFormState;
}