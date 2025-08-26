// lib/domain/entities/shared/page.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'page.freezed.dart';

/// Representa uma página de dados de negócio, agnóstica de implementação.
/// O tipo [T] representa o tipo da entidade de domínio no conteúdo (ex: AthleteSummary).
@freezed
abstract class Page<T> with _$Page<T> {
  const factory Page({
    // A anotação `@Default([])` garante que a lista nunca seja nula.
    @Default([]) List<T> content,
    required int totalElements,
    required int totalPages,
    required int pageNumber,
  }) = _Page<T>;
}