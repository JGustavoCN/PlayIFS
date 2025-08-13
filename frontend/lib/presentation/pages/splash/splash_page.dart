// Ficheiro: lib/presentation/pages/splash/splash_page.dart
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // A única responsabilidade desta página é mostrar um indicador de progresso.
    // A lógica de navegação está 100% no GoRouter.
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}