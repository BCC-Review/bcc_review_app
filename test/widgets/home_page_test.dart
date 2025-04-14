import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:bcc_review_app/ui/home/home_page.dart';
import 'package:bcc_review_app/ui/home/home_view_model.dart';
import 'package:bcc_review_app/ui/home/official_modules/official_modules_view_model.dart';
import 'package:bcc_review_app/ui/home/my_modules/my_modules_view_model.dart';
import 'package:bcc_review_app/config/dependecies.dart';

// Mocks das dependências
class MockHomeViewModel extends Mock implements HomeViewModel {}
class MockOfficialModulesViewModel extends Mock implements OfficialModulesViewModel {}
class MockMyModulesViewModel extends Mock implements MyModulesViewModel {}

void main() {
  late MockHomeViewModel mockHomeViewModel;
  late MockOfficialModulesViewModel mockOfficialModulesViewModel;
  late MockMyModulesViewModel mockMyModulesViewModel;

  setUp(() {
    // Instancia os mocks
    mockHomeViewModel = MockHomeViewModel();
    mockOfficialModulesViewModel = MockOfficialModulesViewModel();
    mockMyModulesViewModel = MockMyModulesViewModel();

    // Stubs para HomeViewModel
    when(() => mockHomeViewModel.addListener(any())).thenAnswer((_) {});
    when(() => mockHomeViewModel.removeListener(any())).thenAnswer((_) {});
    when(() => mockHomeViewModel.user).thenReturn(null);
    when(() => mockHomeViewModel.isStatsPanelVisible).thenReturn(false);
    when(() => mockHomeViewModel.showStatsPanelContent).thenReturn(false);
    when(() => mockHomeViewModel.getUser()).thenAnswer((_) async {});

    // Stubs para OfficialModulesViewModel
    when(() => mockOfficialModulesViewModel.addListener(any())).thenAnswer((_) {});
    when(() => mockOfficialModulesViewModel.removeListener(any())).thenAnswer((_) {});
    when(() => mockOfficialModulesViewModel.getUser()).thenAnswer((_) async {});
    when(() => mockOfficialModulesViewModel.refreshSubjects()).thenAnswer((_) async {});
    when(() => mockOfficialModulesViewModel.isLoading).thenReturn(false);
    when(() => mockOfficialModulesViewModel.subjectsGroupedByPeriod).thenReturn([]);

    // Stubs para MyModulesViewModel
    when(() => mockMyModulesViewModel.addListener(any())).thenAnswer((_) {});
    when(() => mockMyModulesViewModel.removeListener(any())).thenAnswer((_) {});
    // Adicione outros stubs necessários para MyModulesViewModel aqui

    // Injeção dos mocks nas dependências
    injector.addInstance<HomeViewModel>(mockHomeViewModel);
    injector.addInstance<OfficialModulesViewModel>(mockOfficialModulesViewModel);
    injector.addInstance<MyModulesViewModel>(mockMyModulesViewModel);
    injector.commit();
  });

  testWidgets('HomePage exibe corretamente os widgets esperados', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    await tester.pumpAndSettle();

    // Verifica se os widgets principais da pagina principal estão presentes
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(BottomNavigationBar), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byType(PageView), findsOneWidget);

  });
}
