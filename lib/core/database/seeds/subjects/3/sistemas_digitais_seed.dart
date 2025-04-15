import 'package:bcc_review_app/domain/entities/question.dart';

final Map<String, dynamic> sistemasDigitaisSeedData = {
  'name': 'Sistemas Digitais',
  'description':
      'Estudo de sistemas digitais, incluindo álgebra booleana, circuitos lógicos, codificação de sinais e implementação de sistemas computacionais.',
  'period': 3,
  'icon': '{"pack":"roundedMaterial","key":"settings_rounded"}',
  'modules': [
    {
      'name': 'Álgebra Booleana',
      'description':
          'Fundamentos da álgebra booleana, operações lógicas, simplificação de expressões e circuitos lógicos.',
      'isOfficial': true,
      'icon': '{"pack":"roundedMaterial","key":"functions_rounded"}',
      'questions': [
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual é o resultado da operação booleana A AND A?',
          'alternatives': ['A', '0', '1', 'A OR A'],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual expressão booleana representa a operação AND?',
          'alternatives': ['A + B', 'A * B', 'A AND B', 'A OR B'],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'O que é uma expressão booleana simplificada para A AND (A OR B)?',
          'alternatives': ['A', 'A OR B', 'A AND B', 'A XOR B'],
          'correctAnswerIndex': 0,
          'xpInitial': 11,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual é o complemento de A + B?',
          'alternatives': [
            'A\' + B\'', // Assuming ' represents NOT
            'A AND B',
            'A\' + B\'', // Duplicate alternative?
            'NOT A AND NOT B',
          ],
          'correctAnswerIndex': 3,
          'xpInitial': 12,
          'xpReview': 4,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual das seguintes expressões booleanas é equivalente a (A OR B) AND (A OR C)?',
          'alternatives': ['A', 'A OR B', 'A OR (B AND C)', 'A AND B'],
          'correctAnswerIndex': 2,
          'xpInitial': 10,
          'xpReview': 3,
          'isOfficial': true,
        },
      ],
    },
    {
      'name': 'Circuitos Lógicos',
      'description':
          'Construção e análise de circuitos lógicos combinacionais e sequenciais, como portas lógicas, flip-flops e multiplexadores.',
      'isOfficial': true,
      'icon': '{"pack":"roundedMaterial","key":"check_box_rounded"}',
      'questions': [
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual porta lógica gera o valor verdadeiro apenas quando as duas entradas são diferentes?',
          'alternatives': ['AND', 'OR', 'XOR', 'NOT'],
          'correctAnswerIndex': 2,
          'xpInitial': 10,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'O que é um flip-flop?',
          'alternatives': [
            'Uma porta lógica',
            'Um circuito de memória que armazena um bit',
            'Uma operação booleana',
            'Um tipo de registro',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 12,
          'xpReview': 4,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é a principal diferença entre circuitos combinacionais e sequenciais?',
          'alternatives': [
            'Circuitos sequenciais dependem de entradas anteriores, enquanto combinacionais não',
            'Circuitos sequenciais não têm entradas, enquanto combinacionais têm',
            'Circuitos combinacionais têm feedback, enquanto sequenciais não',
            'Circuitos sequenciais operam com portas AND, enquanto combinacionais operam com XOR',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 12,
          'xpReview': 4,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual é a função de um multiplexador?',
          'alternatives': [
            'Selecionar uma entre várias entradas',
            'Armazenar um valor binário',
            'Realizar a operação AND em duas entradas',
            'Realizar a operação OR em várias entradas',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 11,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é a saída de um circuito AND com entradas A = 1 e B = 0?',
          'alternatives': ['1', '0', 'Indefinido', 'Erro'],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 3,
          'isOfficial': true,
        },
      ],
    },
    {
      'name': 'Codificação de Sinais',
      'description':
          'Técnicas de codificação e modulação de sinais digitais, incluindo conversão analógico-digital e digital-analógico.',
      'isOfficial': true,
      'icon': '{"pack":"roundedMaterial","key":"cast_connected_rounded"}',
      'questions': [
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'O que é a conversão de um sinal analógico para digital?',
          'alternatives': [
            'Modulação',
            'Codificação',
            'Amostragem',
            'Quantização',
          ],
          'correctAnswerIndex':
              2, // Note: Sampling is part of ADC, but Quantization is also crucial. Let's keep the original.
          'xpInitial': 10,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é a principal diferença entre codificação NRZ e RZ?',
          'alternatives': [
            'NRZ usa nível de tensão constante, enquanto RZ usa transições no meio de cada bit',
            'NRZ é mais eficiente em termos de largura de banda',
            'RZ é utilizado para sinais analógicos, enquanto NRZ é digital',
            'Não há diferença significativa',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 11,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'O que é a quantização em conversão analógica-digital?',
          'alternatives': [
            'A conversão do sinal analógico para um valor numérico',
            'A amostragem do sinal em intervalos regulares',
            'A escolha do número de bits para representar o sinal', // Note: This is related, but quantization itself is mapping continuous values to discrete levels. Let's keep the original.
            'A escolha do valor máximo para o sinal',
          ],
          'correctAnswerIndex': 2,
          'xpInitial': 12,
          'xpReview': 4,
          'isOfficial': true,
        },
      ],
    },
  ],
};
