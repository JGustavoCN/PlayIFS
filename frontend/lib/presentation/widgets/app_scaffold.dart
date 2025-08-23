// Ficheiro: lib/presentation/widgets/app_scaffold.dart

import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    this.fab,
    this.actions, // ✅ 1. ADICIONAR O PARÂMETRO 'actions'.
  });

  final String title;
  final Widget body;
  final FloatingActionButton? fab;
  final List<Widget>? actions; // ✅ 2. ADICIONAR A PROPRIEDADE.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions, // ✅ 3. PASSAR AS AÇÕES PARA A APPBAR.
      ),
      body: body,
      floatingActionButton: fab,
    );
  }
}