import 'package:bcc_review_app/domain/entities/module.dart';
import 'package:bcc_review_app/domain/entities/question.dart';

// Estrutura de dados centralizada para o seeding inicial do banco de dados.
// Cada mapa na lista representa um Subject.
// Dentro de cada Subject, a chave 'modules' contém uma lista de Modules.
// Dentro de cada Module, a chave 'questions' contém uma lista de Questions.

final List<Map<String, dynamic>> seedSubjectsData = [
  {
    'name': 'Introdução à Programação',
    'description':
        'Conceitos fundamentais de programação utilizando pseudocódigo e introdução a linguagens.',
    'period': 1,
    'icon': 'code',
    'modules': [
      {
        'name': 'Algoritmos e Lógica de Programação',
        'description':
            'Fundamentos de algoritmos, estruturas de decisão (if/else) e repetição (while/for), e lógica básica de programação.',
        'difficultyLevel': DifficultyLevel.easy,
        'isOfficial': true,
        'questions': [
          {
            'type': QuestionType.multipleChoice,
            'statement':
                'Qual estrutura de controle é mais adequada para executar um bloco de código um número fixo de vezes?',
            'alternatives': ['if/else', 'while', 'for', 'switch'],
            'correctAnswerIndex': 2,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que é um algoritmo?',
            'alternatives': [
              'Uma linguagem de programação',
              'Um conjunto de instruções passo a passo para resolver um problema',
              'Um erro no código',
              'Um tipo de dado',
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 8,
            'xpReview': 2,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement':
                'Qual estrutura de repetição é ideal quando não se sabe o número exato de iterações, mas sim uma condição de parada?',
            'alternatives': ['for', 'if', 'while', 'switch'],
            'correctAnswerIndex': 2,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
        ],
      },
      {
        'name': 'Variáveis e Tipos de Dados',
        'description':
            'Aprendizado sobre diferentes tipos de dados (inteiro, real, caractere, lógico), declaração de variáveis e operações básicas.',
        'difficultyLevel': DifficultyLevel.easy,
        'isOfficial': true,
        'questions': [
          {
            'type': QuestionType.multipleChoice,
            'statement':
                'Qual tipo de dado é mais apropriado para armazenar o nome de uma pessoa?',
            'alternatives': ['Inteiro', 'Real', 'Lógico', 'Caractere (String)'],
            'correctAnswerIndex': 3,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement':
                'Qual operador é usado para verificar igualdade de valor em muitas linguagens de programação?',
            'alternatives': ['=', '==', ':=', '!='],
            'correctAnswerIndex': 1,
            'xpInitial': 8,
            'xpReview': 2,
            'isOfficial': true,
          },
        ],
      },
      {
        'name': 'Estruturas de Dados Fundamentais (Introdução)',
        'description':
            'Introdução a vetores (arrays) para armazenamento de coleções de dados do mesmo tipo.',
        'difficultyLevel': DifficultyLevel.medium,
        'isOfficial': true,
        'questions': [
          // Questão 1.3.1
          {
            'type': QuestionType.multipleChoice,
            'statement':
                'Em um vetor de 10 posições (índices de 0 a 9), qual é o índice da última posição?',
            'alternatives': ['10', '9', '0', 'Depende do conteúdo'],
            'correctAnswerIndex': 1,
            'xpInitial': 12,
            'xpReview': 4,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement':
                'Qual é a complexidade de tempo para acessar um elemento em um vetor (array) através do seu índice?',
            'alternatives': ['O(1)', 'O(n)', 'O(log n)', 'O(n^2)'],
            'correctAnswerIndex': 0,
            'xpInitial': 12,
            'xpReview': 4,
            'isOfficial': true,
          },
        ],
      },
    ],
  },
  {
    'name': 'Estruturas de Dados',
    'description':
        'Estudo aprofundado de estruturas para organizar e manipular dados eficientemente.',
    'period': 2,
    'icon': 'data_usage',
    'modules': [
      {
        'name': 'Listas Encadeadas',
        'description': 'Implementação e uso de listas lineares dinâmicas.',
        'difficultyLevel': DifficultyLevel.medium,
        'isOfficial': true,
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
  },
];
