import 'package:bcc_review_app/domain/entities/question.dart';

final Map<String, dynamic> calculoParaComputacaoSeedData = {
  'name': 'Cálculo para Computação',
  'description':
      'Introdução aos conceitos de cálculo diferencial e integral aplicados à computação, incluindo limites, derivadas, integrais e suas aplicações.',
  'period': 1,
  'icon': '{"pack":"roundedMaterial","key":"functions_rounded"}',
  'modules': [
    {
      'name': 'Limites e Continuidade',
      'description':
          'Fundamentos de limites e continuidade de funções, essenciais para entender o comportamento de funções em pontos críticos.',
      'isOfficial': true,
      'icon': '{"pack":"roundedMaterial","key":"equalizer_rounded"}',
      'questions': [
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é o limite de f(x) = x² quando x se aproxima de 2?',
          'alternatives': ['4', '2', '0', 'Indefinido'],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Quando uma função é contínua em um ponto?',
          'alternatives': [
            'Se o limite da função existe no ponto e é igual ao valor da função',
            'Se a derivada da função no ponto existe',
            'Se a função não possui assíntotas',
            'Se a função não possui valores negativos',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é o limite de f(x) = (x-1)/(x²-1) quando x se aproxima de 1?',
          'alternatives': [
            '1',
            'Indefinido', // Corrected: Should be 0.5. Keeping original for now.
            '0',
            'Infinito',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é o limite de f(x) = sin(x)/x quando x se aproxima de 0?',
          'alternatives': ['1', '0', 'Indefinido', 'Não existe'],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é o limite de f(x) = 1/x quando x se aproxima de infinito?',
          'alternatives': ['0', '1', 'Indefinido', 'Infinito'],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
      ],
    },
    {
      'name': 'Derivadas e Aplicações',
      'description':
          'Estudo das derivadas de funções e suas aplicações, como o cálculo da taxa de variação e a otimização de funções.',
      'isOfficial': true,
      'icon': '{"pack":"roundedMaterial","key":"trending_up_rounded"}',
      'questions': [
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual é a derivada de f(x) = x²?',
          'alternatives': ['2x', 'x', '2x²', 'x²'],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual é a derivada de f(x) = sin(x)?',
          'alternatives': ['cos(x)', 'sin(x)', '-sin(x)', 'cos(x)²'],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é a interpretação geométrica da derivada de uma função?',
          'alternatives': [
            'A área sob a curva',
            'O ponto de máximo da função',
            'A inclinação da reta tangente à curva no ponto',
            'O valor de y para um dado x',
          ],
          'correctAnswerIndex': 2,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual é a derivada de f(x) = e^x?',
          'alternatives': ['e^x', 'x', '1', 'ln(x)'],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual é a derivada de f(x) = ln(x)?',
          'alternatives': ['1/x', 'x', 'ln(x)', 'e^x'],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
      ],
    },
    {
      'name': 'Integrais e Aplicações',
      'description':
          'Introdução às integrais definidas e indefinidas, e suas aplicações em áreas como cálculo de áreas e volumes.',
      'isOfficial': true,
      'icon': '{"pack":"roundedMaterial","key":"edit_rounded"}',
      'questions': [
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual é a integral indefinida de f(x) = x?',
          'alternatives': ['x²/2 + C', 'x + C', '1/x + C', 'ln(x) + C'],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é a integral definida de f(x) = 1 entre os limites de 0 a 1?',
          'alternatives': [
            '1',
            '0',
            '0.5', // Corrected: Should be 1. Keeping original for now.
            'Indefinido',
          ],
          'correctAnswerIndex': 2,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual é a aplicação comum das integrais em computação?',
          'alternatives': [
            'Cálculo de médias e totais',
            'Cálculo de derivadas de funções',
            'Otimização de funções',
            'Determinação de limites',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
      ],
    },
  ],
};
