import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    this.fab,
    this.actions,
    this.bottomNavigationBar, // ✅ 1. ADICIONAR O NOVO PARÂMETRO OPCIONAL
  });

  final String title;
  final Widget body;
  final FloatingActionButton? fab;
  final List<Widget>? actions;
  final Widget? bottomNavigationBar; // ✅ 2. ADICIONAR A NOVA PROPRIEDADE

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: body,
      floatingActionButton: fab,
      bottomNavigationBar: bottomNavigationBar, // ✅ 3. PASSAR O WIDGET PARA O SCAFFOLD
    );
}