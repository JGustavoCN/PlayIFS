import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_credentials.freezed.dart';

/// Representa as credenciais necessárias para um utilizador se autenticar.
/// É uma entidade de domínio pura que agrupa os dados de entrada da UI.
@freezed
abstract class LoginCredentials with _$LoginCredentials {
  /// O construtor factory cria uma instância imutável das credenciais.
  const factory LoginCredentials({
    required String registration,
    required String password,
  }) = _LoginCredentials;
}