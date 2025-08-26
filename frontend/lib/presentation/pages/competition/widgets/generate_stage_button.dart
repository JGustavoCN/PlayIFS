import 'package:flutter/material.dart';

/// Um botão de ação padrão para gerar fases de um torneio.
class GenerateStageButton extends StatelessWidget {
  const GenerateStageButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => FilledButton.icon(
    icon: const Icon(Icons.casino_outlined),
    label: Text(label),
    onPressed: onPressed,
  );
}