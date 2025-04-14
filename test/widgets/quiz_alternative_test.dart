import 'package:bcc_review_app/ui/quiz/%5Bid%5D/widgets/quiz_alternative.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Criando um Mock para a função de callback
class MockCallback extends Mock {
  void call();
}

void main() {
  testWidgets('QuizAlternative deve exibir a alternativa corretamente', (WidgetTester tester) async {
    // Variáveis para os testes
    const index = 0;
    const text = 'Alternativa A';
    const isSelected = false;
    const showResult = false;
    const isCorrect = false;

    // Função mock para onTap
    final mockOnTap = MockCallback();

    // Widget para testar
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QuizAlternative(
            index: index,
            text: text,
            isSelected: isSelected,
            showResult: showResult,
            isCorrect: isCorrect,
            onTap: mockOnTap.call,  // Passa o MockCallback para onTap
          ),
        ),
      ),
    );

    // Verifica se o texto da alternativa está sendo exibido corretamente
    expect(find.text('Alternativa A'), findsOneWidget);

    // Verifica se o widget responde ao clique (onTap)
    await tester.tap(find.byType(InkWell));
    verify(mockOnTap.call).called(1); // Verifica se o onTap foi chamado

    // Testando se o widget muda a cor de fundo quando mostrar o resultado (showResult = true)
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QuizAlternative(
            index: index,
            text: text,
            isSelected: true,  // Altera para 'selecionado'
            showResult: true,  // Mostra o resultado
            isCorrect: true,   // Marca como correto
            onTap: mockOnTap,
          ),
        ),
      ),
    );

    // Verifica se o Card tem a cor de fundo esperada (para verde, se estiver correto)
    final card = tester.widget<Card>(find.byType(Card));
    final cardColor = card.color;
    expect(cardColor, equals(Colors.green.shade100));

    // Verifica se o ícone correto foi exibido
    final icon = tester.widget<Icon>(find.byIcon(Icons.check_circle));
    expect(icon.color, equals(Colors.green));

    // Teste com a alternativa errada
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QuizAlternative(
            index: index,
            text: text,
            isSelected: true,
            showResult: true,
            isCorrect: false, // Marca como incorreto
            onTap: mockOnTap,
          ),
        ),
      ),
    );

    // Verifica se o Card tem a cor de fundo esperada (para vermelho, se estiver incorreto)
    final incorrectCard = tester.widget<Card>(find.byType(Card));
    final incorrectCardColor = incorrectCard.color;
    expect(incorrectCardColor, equals(Colors.red.shade100));

    // Verifica se o ícone correto foi exibido
    final incorrectIcon = tester.widget<Icon>(find.byIcon(Icons.cancel));
    expect(incorrectIcon.color, equals(Colors.red));
  });
}
