// Ficheiro: lib/presentation/widgets/app_scaffold.dart

import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    this.fab,
  });

  final String title;
  final Widget body;
  final FloatingActionButton? fab;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      body: body,
      floatingActionButton: fab,
    );
}