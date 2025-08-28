import 'package:flutter_test/flutter_test.dart';
import 'package:bcc_review_app/core/constants/gemini_models.dart';

void main() {
  group('GeminiModels Constants', () {
    test('should have non-empty list of available models', () {
      expect(availableGeminiModels, isNotEmpty);
      expect(availableGeminiModels.length, greaterThan(0));
    });

    test('should have default model in available models list', () {
      expect(availableGeminiModels, contains(defaultGeminiModel));
    });

    test('should have expected models in the list', () {
      expect(availableGeminiModels, contains('gemini-2.0-flash'));
      expect(availableGeminiModels, contains('gemini-2.0-flash-lite-001'));
      expect(availableGeminiModels, contains('gemini-2.0-flash-thinking-exp-01-21'));
      expect(availableGeminiModels, contains('gemini-2.5-pro-preview-03-25'));
    });

    test('should have correct default model', () {
      expect(defaultGeminiModel, equals('gemini-2.0-flash-thinking-exp-01-21'));
    });

    test('all models should be non-empty strings', () {
      for (final model in availableGeminiModels) {
        expect(model, isNotEmpty);
        expect(model, isA<String>());
      }
    });
  });
}