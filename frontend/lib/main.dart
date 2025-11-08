// Ficheiro: lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart'; // 1. Import reordenado
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/routing/app_routes.dart';
import 'package:playifs_frontend/core/theme/app_theme.dart';
// Importe o seu novo provider de tema
import 'package:playifs_frontend/presentation/providers/theme/theme_provider.dart';


// O 'main' agora precisa ser 'async' para aguardar as inicializações.
Future<void> main() async {
  // Garantir que os Widgets do Flutter estejam inicializados
  // e guardar a referência.
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Chamar 'preserve' para manter a splash nativa na tela
  // até mandarmos removê-la manualmente (o que faremos no GoRouter).
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // 2. CORREÇÃO: 'setupLocator' é síncrono (void),
  //    portanto o 'await' foi removido.
  setupLocator();

  // O runApp permanece o mesmo.
  runApp(const ProviderScope(child: MyApp()));
}

// Nenhuma mudança necessária no widget MyApp.
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Observamos o estado do nosso themeNotifierProvider.
    // Sempre que o estado mudar, a MyApp será reconstruída com o novo tema.
    final themeMode = ref.watch(themeProvider);
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