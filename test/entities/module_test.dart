import 'package:flutter_test/flutter_test.dart';
import 'package:bcc_review_app/domain/entities/module.dart';

void main() {
  group('Module Entity', () {
    test('should create a valid Module instance', () {
      final module = Module(
        name: 'Introdução à Programação',
        description: 'Aprenda o básico de programação',
        isOfficial: true,
        icon: "dsadas",
      );

      expect(module.name, 'Introdução à Programação');
      expect(module.description, 'Aprenda o básico de programação');
      expect(module.isOfficial, true);
      expect(module.icon, 'dsadas');
      expect(module.id, isNull); // pois não foi atribuído
      expect(module.multipleChoiceQuestions.isEmpty, true);
      expect(module.subject.value, isNull);
    });
  });
}
