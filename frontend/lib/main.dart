// Ficheiro: lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/di/locator.dart';
import 'core/routing/app_routes.dart';
import 'core/theme/app_theme.dart';
// Importe o seu novo provider de tema
import 'presentation/providers/theme/theme_provider.dart';

void main() {
  setupLocator();
  runApp(const ProviderScope(child: MyApp()));
}

// MyApp agora é um ConsumerWidget, mais simples e reativo.
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Observamos o estado do nosso themeNotifierProvider.
    // Sempre que o estado mudar, a MyApp será reconstruída com o novo tema.
    final themeMode = ref.watch(themeNotifierProvider);
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'PlayIFS',
      debugShowCheckedModeBanner: false,

      // O tema é fornecido pelo nosso AppTheme central.
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      // O themeMode agora vem diretamente do nosso provider.
      themeMode: themeMode,

      routerConfig: router,
    );
  }
}