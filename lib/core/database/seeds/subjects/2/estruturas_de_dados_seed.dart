import 'package:bcc_review_app/domain/entities/question.dart';

final Map<String, dynamic> estruturasDeDadosSeedData = {
  'name': 'Estruturas de Dados',
  'description':
      'Estudo aprofundado de estruturas para organizar e manipular dados eficientemente.',
  'period': 2,
  'icon': '{"pack":"roundedMaterial","key":"data_usage_rounded"}',
  'modules': [
    {
      'name': 'Listas Encadeadas',
      'description': 'Implementação e uso de listas lineares dinâmicas.',
      'isOfficial': true,
      'icon': '{"pack":"roundedMaterial","key":"link_rounded"}',
      'questions': [
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual a principal vantagem de uma lista encadeada sobre um vetor?',
          'alternatives': [
            'Acesso mais rápido a elementos por índice',
            'Tamanho dinâmico e inserção/remoção eficiente no meio',
            'Menor uso de memória sempre',
            'Facilidade de ordenação',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 15,
          'xpReview': 5,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual a complexidade de tempo para inserir um elemento no início de uma lista simplesmente encadeada?',
          'alternatives': ['O(1)', 'O(n)', 'O(log n)', 'O(n^2)'],
          'correctAnswerIndex': 0,
          'xpInitial': 15,
          'xpReview': 5,
          'isOfficial': true,
        },
      ],
    },
  ],
};
