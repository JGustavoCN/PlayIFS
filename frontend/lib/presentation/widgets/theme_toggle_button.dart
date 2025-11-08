// Ficheiro: lib/presentation/widgets/theme_toggle_button.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/theme/theme_provider.dart';

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // O botão observa o estado do tema para saber qual ícone mostrar.
    final themeMode = ref.watch(themeProvider);

    return IconButton(
      icon: Icon(
        // Usamos um switch para lidar com os 3 estados possíveis (incluindo 'system')
        switch (themeMode) {
          ThemeMode.light => Icons.dark_mode_outlined,
          ThemeMode.dark => Icons.light_mode_outlined,
          ThemeMode.system => Icons.brightness_auto_outlined,
        },
      ),
      onPressed: () {
        // Ao ser pressionado, ele chama o método do notifier para trocar o tema.
        // Usamos 'read' porque estamos numa função de callback.
        ref.read(themeProvider.notifier).toggleTheme();
      },
      tooltip: 'Mudar Tema',
    );
  }
}