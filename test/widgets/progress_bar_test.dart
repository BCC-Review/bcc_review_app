import 'package:bcc_review_app/ui/quiz/%5Bid%5D/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ProgressBar deve exibir progresso corretamente', (WidgetTester tester) async {
    // Widget para testar
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProgressBar(
            current: 3,
            total: 5,
          ),
        ),
      ),
    );

    // Aguarda a animação ser completada
    await tester.pumpAndSettle(Duration(milliseconds: 500));

    // Verifica se o ProgressBar foi renderizado inicialmente
    expect(find.byType(ProgressBar), findsOneWidget);
    expect(find.byType(LinearProgressIndicator), findsOneWidget);

    // Verifica o progresso inicial (deve ser 60%)
    final progressIndicator = tester.widget<LinearProgressIndicator>(find.byType(LinearProgressIndicator));
    expect(progressIndicator.value, equals(0.6)); // 3 de 5 é 60%

    // Teste com valores diferentes de current
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProgressBar(
            current: 0,
            total: 5,
          ),
        ),
      ),
    );

    // Aguarda a animação ser completada
    await tester.pumpAndSettle(Duration(milliseconds: 500));

    // Verifica se o progresso está em 0% quando current = 0
    final zeroProgressIndicator = tester.widget<LinearProgressIndicator>(find.byType(LinearProgressIndicator));
    expect(zeroProgressIndicator.value, equals(0.0));

    // Teste com total > current
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProgressBar(
            current: 5,
            total: 5,
          ),
        ),
      ),
    );

    // Aguarda a animação ser completada
    await tester.pumpAndSettle(Duration(milliseconds: 500));

    // Verifica se o progresso está em 100% quando current = total
    final fullProgressIndicator = tester.widget<LinearProgressIndicator>(find.byType(LinearProgressIndicator));
    expect(fullProgressIndicator.value, equals(1.0));
  });
}
