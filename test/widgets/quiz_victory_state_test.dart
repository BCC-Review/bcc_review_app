import 'package:bcc_review_app/ui/quiz/%5BmoduleId%5D/widgets/quiz_victory_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Criando um Mock para os callbacks
class MockCallback extends Mock {
  void call();
}

void main() {
  testWidgets('QuizVictoryState deve exibir os elementos corretamente', (
    WidgetTester tester,
  ) async {
    // Função mock para o callback
    final mockOnBackToModules = MockCallback();

    // Widget para testar
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QuizVictoryState(
            totalXPEarned: 150, // Exemplo de XP
            onRetry: () {},
            onBackToModules: mockOnBackToModules.call,
          ),
        ),
      ),
    );

    // Verifica se o texto "Parabéns!" está sendo exibido corretamente
    expect(find.text('Parabéns!'), findsOneWidget);

    // Verifica se o ícone de "emoji_events" é exibido
    expect(find.byIcon(Icons.emoji_events), findsOneWidget);

    // Verifica se o texto "Você completou o quiz!" está sendo exibido
    expect(find.text('Você completou o quiz!'), findsOneWidget);

    // Verifica se o XP Total está sendo exibido corretamente
    expect(find.text('XP Total: 150'), findsOneWidget);

    // Verifica se o botão "Concluir" é exibido
    expect(find.text('Concluir'), findsOneWidget);
  });

  testWidgets(
    'QuizVictoryState deve chamar o callback ao clicar no botão "Concluir"',
    (WidgetTester tester) async {
      // Função mock para o callback
      final mockOnBackToModules = MockCallback();

      // Widget para testar
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: QuizVictoryState(
              totalXPEarned: 150, // Exemplo de XP
              onRetry: () {},
              onBackToModules: mockOnBackToModules.call,
            ),
          ),
        ),
      );

      // Teste do clique no botão "Concluir"
      await tester.tap(find.text('Concluir'));
      verify(
        mockOnBackToModules.call,
      ).called(1); // Verifica se o callback foi chamado
    },
  );
}
