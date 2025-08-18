// Ficheiro: lib/data/repositories/base_repository.dart
import 'package:dio/dio.dart';
import 'package:playifs_frontend/core/network/exceptions.dart';
import 'package:playifs_frontend/core/network/result.dart';

/// Classe base para todos os repositórios, centralizando o tratamento de erros.
///
/// Implementa o padrão de manipulação de chamadas de API para garantir
/// consistência e robustez em toda a camada de dados.
abstract class BaseRepository {
  /// Executa uma chamada de API e trata os resultados e exceções de forma padronizada.
  ///
  /// Recebe uma função [apiCall] que representa a chamada de rede a ser executada.
  /// Retorna um [Result] encapsulando o sucesso ou a falha.
  Future<Result<T>> handleApiCall<T>(Future<T> Function() apiCall) async {
    try {
      return Result.success(await apiCall());
    } on DioException catch (e) {
      // 1. INSPECIONA O ERRO ENRIQUECIDO: Verifica se o DioClient
      //    já identificou e anexou uma ValidationException.
      if (e.error is ValidationException) {
        // 2. PRESERVA A EXCEÇÃO ESPECÍFICA: Se for um erro de validação,
        //    ele o passa adiante intacto para a UI.
        return Result.failure(e.error as ValidationException);
      }

      // 3. TRADUZ OUTROS ERROS DE REDE: Para outros erros do Dio (404, 403, 500),
      //    cria uma ApiException, que é a nossa exceção genérica oficial.
      final message =
          e.response?.data?['error'] ?? e.message ?? 'Erro desconhecido';
      return Result.failure(ApiException(
        message,
        statusCode: e.response?.statusCode,
      ));
    } catch (e) {
      // 4. CAPTURA ERROS INESPERADOS: Para qualquer outra coisa (erros de parsing, etc.),
      //    envolve numa ApiException.
      return Result.failure(ApiException(e.toString()));
    }
  }
}