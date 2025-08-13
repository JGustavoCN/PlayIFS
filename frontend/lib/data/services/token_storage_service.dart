// Ficheiro: lib/data/services/token_storage_service.dart

import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/entities/auth/auth_tokens.dart';

/// Contrato para o serviço de armazenamento seguro de tokens.
abstract class TokenStorageService {
  Future<void> saveTokens(AuthTokens tokens);
  Future<AuthTokens?> getTokens();
  Future<void> clearTokens();
}

/// Implementação do serviço de armazenamento usando flutter_secure_storage.
class SecureTokenStorageService implements TokenStorageService {
  final _storage = const FlutterSecureStorage();
  static const _key = 'auth_tokens';

  @override
  Future<void> saveTokens(AuthTokens tokens) async {
    // O método toJson() é gerado pelo freezed na nossa entidade AuthTokens
    final jsonString = jsonEncode(tokens.toJson());
    await _storage.write(key: _key, value: jsonString);
  }

  @override
  Future<AuthTokens?> getTokens() async {
    try {
      final jsonString = await _storage.read(key: _key);

      // CORREÇÃO CRÍTICA:
      // Se não houver string ou ela estiver vazia, retornamos null imediatamente.
      // Isto garante que na primeira inicialização o estado seja 'não logado'.
      if (jsonString == null || jsonString.isEmpty) {
        return null;
      }

      // Se houver uma string, tentamos fazer o parse.
      return AuthTokens.fromJson(jsonDecode(jsonString));
    } catch (e) {
      // Se houver qualquer erro durante a leitura ou o parsing do JSON
      // (ex: dados corrompidos), limpamos a chave por segurança e
      // retornamos null para tratar o utilizador como não logado.
      await clearTokens();
      return null;
    }
  }

  @override
  Future<void> clearTokens() async {
    await _storage.delete(key: _key);
  }
}