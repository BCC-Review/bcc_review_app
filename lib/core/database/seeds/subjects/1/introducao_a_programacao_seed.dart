import 'package:bcc_review_app/domain/entities/question.dart';

final Map<String, dynamic> introducaoAProramacaoSeedData = {
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
          'xpReview': 2,
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
          'xpInitial': 10,
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
          'xpReview': 2,
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
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Em pseudocódigo, qual palavra-chave geralmente inicia um bloco de decisão?',
          'alternatives': ['INICIO', 'PARA', 'SE', 'ENQUANTO'],
          'correctAnswerIndex': 2,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual operador lógico representa "E" (conjunção)?',
          'alternatives': ['OU', 'NAO', 'E', '|'],
          'correctAnswerIndex': 2,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual operador lógico representa "OU" (disjunção)?',
          'alternatives': ['E', 'NAO', 'OU', '&'],
          'correctAnswerIndex': 2,
          'xpInitial': 10,
          'xpReview': 2,
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
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual estrutura de repetição executa o bloco de código pelo menos uma vez, antes de verificar a condição?',
          'alternatives': ['for', 'while', 'do-while', 'if'],
          'correctAnswerIndex':
              2, // Assumindo que 'do-while' seria a representação conceitual
          'xpInitial': 10,
          'xpReview': 2,
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
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual o resultado da expressão lógica: (5 > 3) E (10 < 20)?',
          'alternatives': ['Verdadeiro', 'Falso', 'Erro', 'Indefinido'],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual o resultado da expressão lógica: (10 == 10) OU (5 != 5)?',
          'alternatives': ['Verdadeiro', 'Falso', 'Erro', 'Indefinido'],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
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
          'xpInitial': 10,
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
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual operador é usado para verificar igualdade de valor em muitas linguagens de programação?',
          'alternatives': ['=', '==', ':=', '!='],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual tipo de dado é mais adequado para armazenar a idade de uma pessoa?',
          'alternatives': ['Real', 'Lógico', 'Inteiro', 'Caractere'],
          'correctAnswerIndex': 2,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Para armazenar o preço de um produto, qual tipo de dado é geralmente preferido?',
          'alternatives': [
            'Inteiro',
            'Real (Ponto Flutuante)',
            'Lógico',
            'String',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual tipo de dado representa apenas dois valores: verdadeiro ou falso?',
          'alternatives': ['Inteiro', 'Real', 'Lógico (Booleano)', 'Caractere'],
          'correctAnswerIndex': 2,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'O que significa "declarar" uma variável?',
          'alternatives': [
            'Atribuir um valor a ela',
            'Usá-la em um cálculo',
            'Informar ao programa sobre sua existência e tipo',
            'Apagar a variável da memória',
          ],
          'correctAnswerIndex': 2,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual símbolo é comumente usado para atribuição de valor a uma variável?',
          'alternatives': ['==', '=', ':=', '->'],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Em muitas linguagens, qual o resultado da operação de divisão inteira `7 / 2`?',
          'alternatives': ['3.5', '3', '4', 'Erro'],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual o resultado da operação `5.0 / 2.0`?',
          'alternatives': ['2', '3', '2.5', 'Erro'],
          'correctAnswerIndex': 2,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual tipo de dado é usado para armazenar um único caractere, como \'A\' ou \'%\'?',
          'alternatives': ['String', 'Inteiro', 'Caractere (Char)', 'Booleano'],
          'correctAnswerIndex': 2,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual a principal diferença entre os operadores `=` e `==`?',
          'alternatives': [
            'Não há diferença',
            '`=` compara valores, `==` atribui valores',
            '`=` atribui valores, `==` compara valores',
            '`==` é usado apenas para números',
          ],
          'correctAnswerIndex': 2,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'O que acontece se você tentar usar uma variável antes de declará-la (em linguagens que exigem declaração)?',
          'alternatives': [
            'Nada, o programa assume um valor padrão',
            'O programa atribui o valor 0',
            'Ocorre um erro de compilação ou execução',
            'A variável é criada automaticamente',
          ],
          'correctAnswerIndex': 2,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
      ],
    },
    {
      'name': 'Estruturas de Dados Fundamentais',
      'description':
          'Introdução a vetores (arrays) para armazenamento de coleções de dados do mesmo tipo.',
      'isOfficial': true,
      'icon': '{"pack":"roundedMaterial","key":"view_list_rounded"}',
      'questions': [
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Em um vetor de 10 posições (índices de 0 a 9), qual é o índice da última posição?',
          'alternatives': ['10', '9', '0', 'Depende do conteúdo'],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é a complexidade de tempo para acessar um elemento em um vetor (array) através do seu índice?',
          'alternatives': ['O(1)', 'O(n)', 'O(log n)', 'O(n^2)'],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
      ],
    },
  ],
};
