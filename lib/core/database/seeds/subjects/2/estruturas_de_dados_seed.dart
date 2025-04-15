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
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual a complexidade de tempo para inserir um elemento no início de uma lista simplesmente encadeada?',
          'alternatives': ['O(1)', 'O(n)', 'O(log n)', 'O(n^2)'],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual a principal diferença entre uma lista simplesmente encadeada e uma duplamente encadeada?',
          'alternatives': [
            'A duplamente encadeada permite acesso bidirecional aos nós',
            'A simplesmente encadeada usa menos memória',
            'A inserção é mais rápida na simplesmente encadeada',
            'A busca é sempre O(1) na duplamente encadeada',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual a complexidade de tempo para inserir um elemento no final de uma lista simplesmente encadeada sem um ponteiro para o último nó?',
          'alternatives': ['O(1)', 'O(n)', 'O(log n)', 'O(n^2)'],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'E se a lista simplesmente encadeada tiver um ponteiro para o último nó, qual a complexidade de inserção no final?',
          'alternatives': ['O(1)', 'O(n)', 'O(log n)', 'O(n^2)'],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'O que caracteriza uma lista encadeada circular?',
          'alternatives': [
            'O último nó aponta para o primeiro nó',
            'Possui um nó cabeça especial',
            'Não permite inserção no meio',
            'Todos os nós têm o mesmo valor',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual estrutura de dados segue o princípio LIFO (Last-In, First-Out)?',
          'alternatives': ['Fila', 'Pilha', 'Árvore', 'Grafo'],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual operação adiciona um elemento ao topo de uma pilha?',
          'alternatives': ['Enqueue', 'Dequeue', 'Push', 'Pop'],
          'correctAnswerIndex': 2,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual operação remove o elemento do topo de uma pilha?',
          'alternatives': ['Enqueue', 'Dequeue', 'Push', 'Pop'],
          'correctAnswerIndex': 3,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual estrutura de dados segue o princípio FIFO (First-In, First-Out)?',
          'alternatives': ['Fila', 'Pilha', 'Árvore', 'Grafo'],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual operação adiciona um elemento ao final de uma fila?',
          'alternatives': ['Enqueue', 'Dequeue', 'Push', 'Pop'],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual operação remove o elemento do início de uma fila?',
          'alternatives': ['Enqueue', 'Dequeue', 'Push', 'Pop'],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
      ],
    },
  ],
};
