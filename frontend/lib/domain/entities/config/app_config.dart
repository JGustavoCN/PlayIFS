// Ficheiro: lib/domain/entities/config/app_config.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config.freezed.dart';

/// Representa as configurações dinâmicas da aplicação.
///
/// Contém listas de valores para enums de negócio, permitindo que o frontend
/// se adapte a mudanças no backend sem a necessidade de atualizações de código.
@freezed
abstract class AppConfig with _$AppConfig {
  /// Construtor factory para criar uma instância imutável de AppConfig.
  const factory AppConfig({
    /// Lista de valores possíveis para o nível de um curso.
    required List<String> courseLevels,

    /// Lista de valores possíveis para a fase de um jogo.
    required List<String> gamePhases,

    /// Lista de valores possíveis para o status de um jogo.
    required List<String> gameStatuses,
  }) = _AppConfig;
}