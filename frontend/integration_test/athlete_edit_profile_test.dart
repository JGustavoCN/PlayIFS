// integration_test/athlete_edit_profile_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/data/services/token_storage_service.dart';
import 'package:playifs_frontend/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Prepara o ambiente de teste antes de tudo.
  setUpAll(setupLocator);

  tearDownAll(() async {
    await GetIt.I.reset();
  });

  group('Fluxo de Atleta: Editar Perfil', () {
    // Garante que o atleta não está logado antes de cada teste.
    setUp(() async {
      final tokenStorage = locator<TokenStorageService>();
      await tokenStorage.clearTokens();
    });

    testWidgets(
        'Deve fazer login, navegar para edição, alterar o nome e verificar a alteração',
            (WidgetTester tester) async {
          // 1. INICIALIZAÇÃO DO APP - Simples e Direta
          app.main();
          await tester.pumpAndSettle();

          // 2. PROCESSO DE LOGIN
          debugPrint('--- Efetuando login como atleta ---');
          await tester.enterText(
              find.byKey(const ValueKey('login_username_field')), '202301');
          await tester.enterText(
              find.byKey(const ValueKey('login_password_field')), 'pass123');
          await tester.tap(find.byKey(const ValueKey('login_button')));
          await tester.pumpAndSettle(const Duration(seconds: 4));

          // 3. NAVEGAÇÃO PARA A PÁGINA DE EDIÇÃO
          debugPrint('--- Navegando para a edição de perfil ---');
          final editProfileButton =
          find.byKey(const ValueKey('edit_profile_button'));
          await tester.ensureVisible(editProfileButton);
          await tester.tap(editProfileButton);
          await tester.pumpAndSettle();

          // 4. EDIÇÃO DO FORMULÁRIO
          debugPrint('--- Alterando o nome para "Gustavo" ---');
          await tester.enterText(
              find.byKey(const ValueKey('edit_athlete_fullName_field')), 'Gustavo');
          await tester.tap(find.byKey(const ValueKey('edit_athlete_save_button')));
          await tester.pumpAndSettle(const Duration(seconds: 4));

          // 5. VERIFICAÇÃO FINAL
          debugPrint('--- Verificando se o nome foi atualizado na HomePage ---');
          expect(find.byKey(const ValueKey('edit_profile_button')), findsOneWidget);
          expect(find.text('Gustavo'), findsOneWidget);

          debugPrint('Teste concluído com sucesso!');
        });
  });
}