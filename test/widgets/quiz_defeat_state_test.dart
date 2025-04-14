import 'package:bcc_review_app/ui/quiz/%5Bid%5D/widgets/quiz_defeat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Criando um Mock para os callbacks
class MockCallback extends Mock {
  void call();
}

void main() {
  testWidgets('QuizDefeatState deve exibir os elementos corretamente', (WidgetTester tester) async {
    // Funções mock para os callbacks
    final mockOnRetry = MockCallback();
    final mockOnBackToModules = MockCallback();

    // Widget para testar
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QuizDefeatState(
            totalXPEarned: 0,
            onRetry: mockOnRetry,
            onBackToModules: mockOnBackToModules,
          ),
        ),
      ),
    );

    // Verifica se o texto "Fim de Jogo!" está sendo exibido corretamente
    expect(find.text('Fim de Jogo!'), findsOneWidget);

    // Verifica se o ícone de coração partido é exibido
    expect(find.byIcon(Icons.heart_broken), findsOneWidget);

    // Verifica se o texto "Você perdeu todas as vidas." está sendo exibido
    expect(find.text('Você perdeu todas as vidas.'), findsOneWidget);

    // Verifica se o botão "Voltar aos Módulos" é exibido
    expect(find.text('Voltar aos Módulos'), findsOneWidget);

    // Verifica se o botão "Tentar Novamente" é exibido
    expect(find.text('Tentar Novamente'), findsOneWidget);
  });

  testWidgets('QuizDefeatState deve chamar os callbacks ao clicar nos botões', (WidgetTester tester) async {
    // Funções mock para os callbacks
    final mockOnRetry = MockCallback();
    final mockOnBackToModules = MockCallback();

    // Widget para testar
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QuizDefeatState(
            totalXPEarned: 0,
            onRetry: mockOnRetry,
            onBackToModules: mockOnBackToModules,
          ),
        ),
      ),
    );

    // Teste do clique no botão "Voltar aos Módulos"
    await tester.tap(find.text('Voltar aos Módulos'));
    verify(mockOnBackToModules.call).called(1);

    // Teste do clique no botão "Tentar Novamente"
    await tester.tap(find.text('Tentar Novamente'));
    verify(mockOnRetry.call).called(1);
  });
}
