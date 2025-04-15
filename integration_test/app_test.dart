import 'dart:math';

import 'package:bcc_review_app/ui/quiz/%5Bid%5D/widgets/quiz_alternative.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:bcc_review_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Fluxo de Entrar no Aplicativo', (WidgetTester tester) async {
    // Inicializa o app
    app.main();
    await tester.pumpAndSettle();

    /* FLUXO 1: ACESSO DO USUÁRIO */
    //Verificar se será necessário logar

    final entrarButton = find.text('Entrar');
    final username = "Douglas";

    //Caso sim, insira um nome de usuário e pressione o botão de 'Entrar'
    if (entrarButton.evaluate().isNotEmpty) {
      await tester.tap(entrarButton);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key('username_field')), username);
      await tester.tap(find.byKey(Key('login_button')));
      await tester.pumpAndSettle();
    }

    // Espera que a tela principal carregue
    expect(find.text(username), findsOneWidget);
    await tester.pump(Duration(seconds: 2));

    /* FLUXO 2: QUIZZES PRÉ-DEFINIDOS
    // Navegar para Período->Módulos->Disciplinas->Questionários

    await tester.tap(find.text('Período 1'));
    await tester.pumpAndSettle();
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.text('Introdução à Programação'));
    await tester.pumpAndSettle();
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.text('Algoritmos e Lógica de Programação'));
    await tester.pumpAndSettle();
    await tester.pump(Duration(seconds: 1));

    for(int i = 0; i < 12; i++)
    {
      await tester.pumpAndSettle();
      if(find.text('Tentar Novamente').evaluate().isNotEmpty) {
        break;
      }
      // Encontre e verifique as alternativas disponíveis
      final alternativeButtons = find.byType(QuizAlternative);
      expect(alternativeButtons, findsWidgets);

      // Escolha uma alternativa aleatória (entre quatro)
      final randomIndex = Random().nextInt(4);
      final randomAlternative = alternativeButtons.at(randomIndex);

      // Clique na alternativa aleatória
      await tester.tap(randomAlternative);
      await tester.pumpAndSettle();
      await tester.pump(Duration(seconds: 2));

      // Verifica se o feedback "Correto" ou "Incorreto" aparece
      if (find
          .text('Correto')
          .evaluate()
          .isNotEmpty) {
        expect(find.text('Correto'), findsOneWidget);
        print("CORRETO");
      } else if (find
          .text('Incorreto')
          .evaluate()
          .isNotEmpty) {
        expect(find.text('Incorreto'), findsOneWidget);
        print("INCORRETO");
      }

      // Pressiona o botão de "Ok"
      await tester.tap(find.byKey(Key('ok_button')));
      await tester.pumpAndSettle();
      await tester.pump(Duration(seconds: 3));
    }

    await tester.tap(find.text('Tentar Novamente'));
    await tester.pumpAndSettle();
    await tester.pump(Duration(seconds: 1));

    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('x_button')));
    await tester.pumpAndSettle();
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.text('Sair'));
    await tester.pumpAndSettle();
    await tester.pump(Duration(seconds: 1));

     FLUXO 3: VER EXPERIÊNCIA ADQUIRIDA

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
    await tester.pump(Duration(seconds: 2));

    await tester.tap(find.byKey(Key('xp_button')), warnIfMissed: false);
    await tester.pumpAndSettle();
    await tester.pump(Duration(seconds: 1));*/

    /* FLUXO 4: QUIZZES PERSONALIZADOS */

    await tester.tap(find.text('Meus Módulos'));
    await tester.pumpAndSettle();
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byKey(Key('create_module_button')));
    await tester.pumpAndSettle();
    await tester.pump(Duration(seconds: 1));

    final moduleName = "Trigonometria";
    final moduleDescription = "Estudo dos ângulos.";

    await tester.enterText(find.byKey(Key('module_name_field')), moduleName);
    await tester.enterText(find.byKey(Key('module_description_field')), moduleDescription);
    await tester.tap(find.byKey(Key('module_icon_picker')));
    await tester.pump(Duration(seconds: 2));
    final Size screenSize = tester.getSize(find.byType(MaterialApp));
    final Offset center = Offset(screenSize.width / 2, screenSize.height / 2);
    final Offset bottom = Offset(screenSize.width / 2, screenSize.height / 2 + 180);
    await tester.tapAt(center);
    await tester.pumpAndSettle();
    await tester.tapAt(bottom);
    await tester.pumpAndSettle();
    await tester.pump(Duration(seconds: 2));
  });

}
