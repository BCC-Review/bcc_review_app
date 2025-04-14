import 'package:bcc_review_app/config/dependecies.dart';
import 'package:bcc_review_app/core/database/database.dart';
import 'package:bcc_review_app/core/ui/widgets/logo_widget.dart';
import 'package:bcc_review_app/data/repositories/user/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bcc_review_app/ui/splash/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockDatabase extends Mock implements Database {}
class MockUserRepository extends Mock implements UserRepository {}
class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  // Registra fallback para SharedPreferences
  registerFallbackValue(MockSharedPreferences());

  testWidgets('SplashPage exibe logo e indicador de progresso', (WidgetTester tester) async {
    // Declarando mocks das dependências do widget
    final mockDatabase = MockDatabase();
    final mockUserRepository = MockUserRepository();
    final mockSharedPreferences = MockSharedPreferences();

    // Registra dependências do widget
    injector.addInstance<Database>(mockDatabase);
    injector.addInstance<UserRepository>(mockUserRepository);
    injector.addInstance<SharedPreferences>(mockSharedPreferences);
    injector.commit();

    // Executa o widget de teste
    await tester.pumpWidget(
      const MaterialApp(
        home: SplashPage(skipNavigation: true),
      ),
    );

    await tester.pump();

    // Verifica se o widget LogoWidget e o indicador de progresso estão na tela
    expect(find.byType(LogoWidget), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}