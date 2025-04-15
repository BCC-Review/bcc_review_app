import 'package:bcc_review_app/ui/quiz/%5BmoduleId%5D/widgets/life_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LifeIndicator deve exibir N vidas corretamente', (
    WidgetTester tester,
  ) async {
    // Cria o widget para testar com 3 vidas
    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: LifeIndicator(lives: 3))),
    );

    // Aguarda a animação ser completada
    await tester.pumpAndSettle(Duration(milliseconds: 1000));

    // Verifica se o widget LifeIndicator foi renderizado com 3 vidas
    expect(find.byType(LifeIndicator), findsOneWidget);
    expect(
      find.byIcon(Icons.favorite),
      findsNWidgets(3),
    ); // Verifica se há 3 ícones de vida
  });
}
