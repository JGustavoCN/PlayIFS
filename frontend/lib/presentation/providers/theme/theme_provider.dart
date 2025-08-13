// Ficheiro: lib/presentation/providers/theme/theme_provider.dart

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  // O método 'build' define o estado inicial do nosso provider.
  // Começamos com o tema do sistema.
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  // Método público que a UI irá chamar para trocar o tema.
  void toggleTheme() {
    // Trocamos entre light e dark, ignorando o 'system' para um toggle simples.
    if (state == ThemeMode.light) {
      state = ThemeMode.dark;
    } else {
      state = ThemeMode.light;
    }
  }

  // Opcional: um método para definir um tema específico.
  void setThemeMode(ThemeMode mode) {
    state = mode;
  }
}