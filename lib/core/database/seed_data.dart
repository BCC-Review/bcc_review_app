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
    'icon': '{"pack":"roundedMaterial","key":"code_rounded"}',
    'modules': [
      {
        'name': 'Algoritmos e Lógica de Programação',
        'description':
            'Fundamentos de algoritmos, estruturas de decisão (if/else) e repetição (while/for), e lógica básica de programação.',
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"functions_rounded"}',
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
          {
            'type': QuestionType.multipleChoice,
            'statement':
                'Qual o propósito principal de um fluxograma em programação?',
            'alternatives': [
              'Escrever código eficiente',
              'Representar visualmente a lógica de um algoritmo',
              'Depurar erros de sintaxe',
              'Gerenciar versões de código',
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 9,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement':
                'Em pseudocódigo, qual palavra-chave geralmente inicia um bloco de decisão?',
            'alternatives': ['INICIO', 'PARA', 'SE', 'ENQUANTO'],
            'correctAnswerIndex': 2,
            'xpInitial': 8,
            'xpReview': 2,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual operador lógico representa "E" (conjunção)?',
            'alternatives': ['OU', 'NAO', 'E', '|'],
            'correctAnswerIndex': 2,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual operador lógico representa "OU" (disjunção)?',
            'alternatives': ['E', 'NAO', 'OU', '&'],
            'correctAnswerIndex': 2,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que significa "concatenar" strings?',
            'alternatives': [
              'Dividir uma string em partes menores',
              'Comparar duas strings',
              'Juntar duas ou mais strings em uma única string',
              'Converter uma string para número',
            ],
            'correctAnswerIndex': 2,
            'xpInitial': 9,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement':
                'Qual estrutura de repetição executa o bloco de código pelo menos uma vez, antes de verificar a condição?',
            'alternatives': ['for', 'while', 'do-while', 'if'],
            'correctAnswerIndex':
                2, // Assumindo que 'do-while' seria a representação conceitual
            'xpInitial': 11,
            'xpReview': 4,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que é uma variável "contador" em um loop?',
            'alternatives': [
              'Uma variável que armazena texto',
              'Uma variável que controla o número de vezes que o loop executa',
              'Uma variável que guarda um valor booleano',
              'Uma variável que armazena um resultado de cálculo',
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 9,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement':
                'Qual o resultado da expressão lógica: (5 > 3) E (10 < 20)?',
            'alternatives': ['Verdadeiro', 'Falso', 'Erro', 'Indefinido'],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement':
                'Qual o resultado da expressão lógica: (10 == 10) OU (5 != 5)?',
            'alternatives': ['Verdadeiro', 'Falso', 'Erro', 'Indefinido'],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Para que serve a indentação no código?',
            'alternatives': [
              'Apenas para estética, não afeta a execução',
              'Para indicar blocos de código e melhorar a legibilidade',
              'Para declarar variáveis',
              'Para comentar o código',
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 8,
            'xpReview': 2,
            'isOfficial': true,
          },
        ],
      },
      {
        'name': 'Variáveis e Tipos de Dados',
        'description':
            'Aprendizado sobre diferentes tipos de dados (inteiro, real, caractere, lógico), declaração de variáveis e operações básicas.',
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"data_object_rounded"}',
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
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"view_list_rounded"}',
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
  },
];
