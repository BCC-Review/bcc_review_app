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

    //Verifica se será necessário logar
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
  });
}
