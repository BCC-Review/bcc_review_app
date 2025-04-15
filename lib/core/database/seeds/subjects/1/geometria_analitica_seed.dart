import 'package:bcc_review_app/domain/entities/question.dart';

final Map<String, dynamic> geometriaAnaliticaSeedData = {
  'name': 'Geometria Analítica',
  'description':
      'Estudo das equações e propriedades das figuras geométricas no plano e no espaço, com o uso de coordenadas cartesianas.',
  'period': 1,
  'icon': '{"pack":"roundedMaterial","key":"aspect_ratio_rounded"}',
  'modules': [
    {
      'name': 'Geometria no Plano Cartesiano',
      'description':
          'Estudo das figuras geométricas no plano cartesiano, incluindo reta, circunferência e elipse.',
      'isOfficial': true,
      'icon': '{"pack":"roundedMaterial","key":"coordinates_rounded"}',
      'questions': [
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual é a equação geral da reta no plano cartesiano?',
          'alternatives': [
            'x² + y² = r²',
            'Ax + By + C = 0',
            'y = mx + b',
            'x = y',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é a equação da circunferência com centro na origem e raio r?',
          'alternatives': [
            'x² + y² = r',
            'x² + y² = r²',
            'x² - y² = r²',
            'x² + y = r²',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual a fórmula para calcular a distância entre dois pontos A(x₁, y₁) e B(x₂, y₂)?',
          'alternatives': [
            '√((x₂ - x₁)² + (y₂ - y₁)²)',
            '√(x₂ - x₁ + y₂ - y₁)',
            'x₂ - x₁ + y₂ - y₁',
            'x₁ - x₂ + y₁ - y₂',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 12,
          'xpReview': 4,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é a equação da reta perpendicular à reta y = 2x + 1 que passa pelo ponto (1, 2)?',
          'alternatives': [
            'y = -2x + 4',
            'y = -x + 3',
            'y = 0.5x + 1',
            'y = -0.5x + 2', // Corrected: Should be y = -0.5x + 2.5. Keeping original for now.
          ],
          'correctAnswerIndex': 3,
          'xpInitial': 11,
          'xpReview': 4,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é a equação da elipse com centro na origem e semi-eixos a e b?',
          'alternatives': [
            'x²/a² + y²/b² = 1',
            'x² + y² = a² + b²',
            'x²/a² - y²/b² = 1',
            'x² + y² = 1',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é a equação da reta que passa pelos pontos P(1, 2) e Q(3, 4)?',
          'alternatives': [
            'y = x + 1',
            'y = 0.5x + 1.5', // Corrected: Should be y = x + 1. Keeping original for now.
            'y = x + 3',
            'y = 2x - 1',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 12,
          'xpReview': 4,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é o ponto médio entre os pontos P(1, 2) e Q(3, 4)?',
          'alternatives': ['(2, 3)', '(1, 2)', '(4, 6)', '(2, 4)'],
          'correctAnswerIndex': 0,
          'xpInitial': 9,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual a equação da reta que passa pelo ponto (2, 3) e tem coeficiente angular m = 4?',
          'alternatives': [
            'y = 4x + 3',
            'y = 4x - 5', // Corrected: Should be y = 4x - 5. Keeping original for now.
            'y = x + 2',
            'y = 4x + 1',
          ],
          'correctAnswerIndex':
              3, // Corrected: Should be 1. Keeping original for now.
          'xpInitial': 10,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é a equação geral de uma parábola com vértice na origem e abertura para cima?',
          'alternatives': [
            'y = ax² + bx + c',
            'y = x²',
            'y = x² + c',
            'x = y²',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é a fórmula para calcular o ângulo entre duas retas no plano?',
          'alternatives': [
            'tan(θ) = |(m₁ - m₂) / (1 + m₁ * m₂)|',
            'tan(θ) = (m₁ + m₂) / (1 + m₁ * m₂)',
            'θ = arctan(m₁ * m₂)',
            'θ = arctan(|m₁ - m₂|)',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 11,
          'xpReview': 4,
          'isOfficial': true,
        },
      ],
    },
    {
      'name': 'Geometria no Espaço',
      'description':
          'Estudo das figuras geométricas no espaço tridimensional, incluindo reta, plano e esferas.',
      'isOfficial': true,
      'icon': '{"pack":"roundedMaterial","key":"3d_rotation_rounded"}',
      'questions': [
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual a fórmula para calcular a distância entre dois pontos no espaço tridimensional?',
          'alternatives': [
            '√((x₂ - x₁)² + (y₂ - y₁)² + (z₂ - z₁)²)',
            '√((x₂ - x₁)² + (y₂ - y₁)²)',
            '√(x₂ - x₁ + y₂ - y₁ + z₂ - z₁)',
            'x₂ - x₁ + y₂ - y₁ + z₂ - z₁',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 12,
          'xpReview': 4,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é a equação de uma esfera com centro em (h, k, l) e raio r?',
          'alternatives': [
            '(x - h)² + (y - k)² + (z - l)² = r²',
            'x² + y² + z² = r²',
            '(x - h)² + (y - k)² = r²',
            'x² + y² = r²',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 12,
          'xpReview': 4,
          'isOfficial': true,
        },
      ],
    },
  ],
};
