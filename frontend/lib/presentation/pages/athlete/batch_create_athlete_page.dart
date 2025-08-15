import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/core/network/exceptions.dart';
import 'package:playifs_frontend/domain/entities/athlete/athlete_input.dart';
import 'package:playifs_frontend/presentation/providers/athlete/athlete_batch_form_provider.dart';

class BatchCreateAthletePage extends ConsumerStatefulWidget {
  const BatchCreateAthletePage({super.key});

  @override
  ConsumerState<BatchCreateAthletePage> createState() =>
      _BatchCreateAthletePageState();
}

class _BatchCreateAthletePageState extends ConsumerState<BatchCreateAthletePage> {
  final _textController = TextEditingController();
  List<AthleteInput> _parsedAthletes = [];

  void _parseAndPreview() {
    setState(() {
      _parsedAthletes = [];
      final lines = _textController.text.split('\n');
      for (final line in lines) {
        final parts = line.split(',');
        if (parts.length == 4) {
          _parsedAthletes.add(
            AthleteInput(
              registration: parts[0].trim(),
              fullName: parts[1].trim(),
              email: parts[2].trim(),
              password: parts[3].trim(),
            ),
          );
        }
      }
    });
  }

  Future<void> _submitForm() async {
    if (_parsedAthletes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nenhum atleta válido para importar.')),
      );
      return;
    }

    final success = await ref
        .read(athleteBatchFormProvider.notifier)
        .batchCreateAthletes(_parsedAthletes);

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Atletas registados com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
      setState(() {
        _parsedAthletes = [];
        _textController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Listener para feedback de erros do provider.
    ref.listen<AsyncValue<void>>(athleteBatchFormProvider, (_, state) {
      state.whenOrNull(
        error: (err, stack) {
          String errorMessage = err.toString();
          if (err is ApiException && err.message.contains('matrículas')) {
            errorMessage = err.message; // Mensagem de negócio específica
          } else if (err is ValidationException) {
            errorMessage = // Mensagem de validação genérica
            'Dados inválidos na lista: ${err.errorDetails.errors.first.message}';
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        },
      );
    });

    final formState = ref.watch(athleteBatchFormProvider);
    final isLoading = formState.isLoading;

    return Scaffold(
      appBar: AppBar(title: const Text('Registo de Atletas em Massa')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Instruções',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Cole os dados dos atletas abaixo, um por linha, no formato:\n'
                  'matricula,nome completo,email,senha',
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _textController,
              maxLines: 10,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '202401,João Silva,joao@email.com,123456\n'
                    '202402,Maria Santos,maria@email.com,654321',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _parseAndPreview,
              child: const Text('Pré-visualizar Importação'),
            ),
            const Divider(height: 32),
            Text(
              'Atletas a serem importados: ${_parsedAthletes.length}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (_parsedAthletes.isNotEmpty)
              SizedBox(
                height: 150, // Altura fixa para a lista de pré-visualização
                child: ListView.builder(
                  itemCount: _parsedAthletes.length,
                  itemBuilder: (context, index) {
                    final athlete = _parsedAthletes[index];
                    return Card(
                      child: ListTile(
                        title: Text(athlete.fullName),
                        subtitle: Text(athlete.registration),
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: isLoading || _parsedAthletes.isEmpty ? null : _submitForm,
              style: FilledButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Salvar Atletas'),
            ),
          ],
        ),
      ),
    );
  }
}