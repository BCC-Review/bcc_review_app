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
    'name': 'Lógica Matemática',
    'description': 'Estudo de proposições, conectivos lógicos, tabelas verdade, quantificadores e inferências lógicas.',
    'period': 1,
    'icon': '{"pack":"roundedMaterial","key":"calculate_rounded"}',
    'modules': [
      {
        'name': 'Proposições e Tabelas Verdade',
        'description': 'Definição de proposições, conectivos lógicos e construção de tabelas verdade.',
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"math_formula_rounded"}',
        'questions': [
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que é uma proposição?',
            'alternatives': [
              'Uma afirmação que pode ser verdadeira ou falsa',
              'Uma equação matemática',
              'Uma sentença sem significado',
              'Uma operação lógica'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual o valor da proposição (p ∧ q) quando p = verdadeiro e q = falso?',
            'alternatives': ['Verdadeiro', 'Falso', 'Indefinido', 'Nenhuma das alternativas'],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual o símbolo lógico para "ou" (disjunção)?',
            'alternatives': ['∧', '∨', '→', '↔'],
            'correctAnswerIndex': 1,
            'xpInitial': 9,
            'xpReview': 2,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que representa a proposição "p → q"?',
            'alternatives': [
              'Se p, então q',
              'p e q são verdadeiros',
              'p é verdadeiro, então q é falso',
              'p ou q é verdadeiro'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual a tabela verdade de p ∨ q (p ou q)?',
            'alternatives': [
              'Verdadeiro, Verdadeiro, Falso, Falso',
              'Falso, Falso, Verdadeiro, Verdadeiro',
              'Verdadeiro, Falso, Falso, Verdadeiro',
              'Verdadeiro, Verdadeiro, Verdadeiro, Falso'
            ],
            'correctAnswerIndex': 2,
            'xpInitial': 12,
            'xpReview': 4,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que é uma tautologia?',
            'alternatives': [
              'Uma proposição que é sempre falsa',
              'Uma proposição que é sempre verdadeira',
              'Uma proposição que pode ser verdadeira ou falsa',
              'Uma proposição sem valor lógico'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 11,
            'xpReview': 4,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é o valor lógico da proposição ~(p ∧ q) quando p = verdadeiro e q = verdadeiro?',
            'alternatives': ['Verdadeiro', 'Falso', 'Indefinido', 'Nenhuma das alternativas'],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que significa a negação de uma proposição?',
            'alternatives': [
              'Transformar uma proposição verdadeira em falsa',
              'Transformar uma proposição falsa em verdadeira',
              'Ambas as alternativas',
              'Nenhuma das alternativas'
            ],
            'correctAnswerIndex': 2,
            'xpInitial': 8,
            'xpReview': 2,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual o valor da proposição (p → q) quando p = falso e q = verdadeiro?',
            'alternatives': ['Verdadeiro', 'Falso', 'Indefinido', 'Nenhuma das alternativas'],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual o quantificador lógico representado por "∀"?',
            'alternatives': ['Existe', 'Para todo', 'Nenhuma das alternativas', 'Algum'],
            'correctAnswerIndex': 1,
            'xpInitial': 9,
            'xpReview': 2,
            'isOfficial': true,
          },
        ],
      },
      {
        'name': 'Quantificadores e Inferência Lógica',
        'description': 'Estudo dos quantificadores lógicos (∀ e ∃) e regras de inferência.',
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"functions_rounded"}',
        'questions': [
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que significa o quantificador "∃"?',
            'alternatives': ['Existe pelo menos um', 'Para todo', 'Não existe', 'Nenhuma das alternativas'],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que é uma inferência lógica?',
            'alternatives': [
              'Uma proposição que não pode ser provada',
              'Uma conclusão válida derivada de premissas verdadeiras',
              'Uma proposição que depende de valores externos',
              'Uma proposição que não tem valor lógico'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 11,
            'xpReview': 4,
            'isOfficial': true,
          },
        ],
      },
    ],
  },
  {
    'name': 'Geometria Analítica',
    'description': 'Estudo das equações e propriedades das figuras geométricas no plano e no espaço, com o uso de coordenadas cartesianas.',
    'period': 1,
    'icon': '{"pack":"roundedMaterial","key":"aspect_ratio_rounded"}',
    'modules': [
      {
        'name': 'Geometria no Plano Cartesiano',
        'description': 'Estudo das figuras geométricas no plano cartesiano, incluindo reta, circunferência e elipse.',
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
              'x = y'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a equação da circunferência com centro na origem e raio r?',
            'alternatives': [
              'x² + y² = r',
              'x² + y² = r²',
              'x² - y² = r²',
              'x² + y = r²'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual a fórmula para calcular a distância entre dois pontos A(x₁, y₁) e B(x₂, y₂)?',
            'alternatives': [
              '√((x₂ - x₁)² + (y₂ - y₁)²)',
              '√(x₂ - x₁ + y₂ - y₁)',
              'x₂ - x₁ + y₂ - y₁',
              'x₁ - x₂ + y₁ - y₂'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 12,
            'xpReview': 4,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a equação da reta perpendicular à reta y = 2x + 1 que passa pelo ponto (1, 2)?',
            'alternatives': [
              'y = -2x + 4',
              'y = -x + 3',
              'y = 0.5x + 1',
              'y = -0.5x + 2'
            ],
            'correctAnswerIndex': 3,
            'xpInitial': 11,
            'xpReview': 4,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a equação da elipse com centro na origem e semi-eixos a e b?',
            'alternatives': [
              'x²/a² + y²/b² = 1',
              'x² + y² = a² + b²',
              'x²/a² - y²/b² = 1',
              'x² + y² = 1'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a equação da reta que passa pelos pontos P(1, 2) e Q(3, 4)?',
            'alternatives': [
              'y = x + 1',
              'y = 0.5x + 1.5',
              'y = x + 3',
              'y = 2x - 1'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 12,
            'xpReview': 4,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é o ponto médio entre os pontos P(1, 2) e Q(3, 4)?',
            'alternatives': [
              '(2, 3)',
              '(1, 2)',
              '(4, 6)',
              '(2, 4)'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 9,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual a equação da reta que passa pelo ponto (2, 3) e tem coeficiente angular m = 4?',
            'alternatives': [
              'y = 4x + 3',
              'y = 4x - 5',
              'y = x + 2',
              'y = 4x + 1'
            ],
            'correctAnswerIndex': 3,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a equação geral de uma parábola com vértice na origem e abertura para cima?',
            'alternatives': [
              'y = ax² + bx + c',
              'y = x²',
              'y = x² + c',
              'x = y²'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a fórmula para calcular o ângulo entre duas retas no plano?',
            'alternatives': [
              'tan(θ) = |(m₁ - m₂) / (1 + m₁ * m₂)|',
              'tan(θ) = (m₁ + m₂) / (1 + m₁ * m₂)',
              'θ = arctan(m₁ * m₂)',
              'θ = arctan(|m₁ - m₂|)'
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
        'description': 'Estudo das figuras geométricas no espaço tridimensional, incluindo reta, plano e esferas.',
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"3d_rotation_rounded"}',
        'questions': [
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual a fórmula para calcular a distância entre dois pontos no espaço tridimensional?',
            'alternatives': [
              '√((x₂ - x₁)² + (y₂ - y₁)² + (z₂ - z₁)²)',
              '√((x₂ - x₁)² + (y₂ - y₁)²)',
              '√(x₂ - x₁ + y₂ - y₁ + z₂ - z₁)',
              'x₂ - x₁ + y₂ - y₁ + z₂ - z₁'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 12,
            'xpReview': 4,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a equação de uma esfera com centro em (h, k, l) e raio r?',
            'alternatives': [
              '(x - h)² + (y - k)² + (z - l)² = r²',
              'x² + y² + z² = r²',
              '(x - h)² + (y - k)² = r²',
              'x² + y² = r²'
            ],
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
    'name': 'Introdução à Computação',
    'description': 'Fundamentos da computação, incluindo conceitos de hardware, software, sistemas operacionais, e algoritmos básicos.',
    'period': 1,
    'icon': '{"pack":"roundedMaterial","key":"computer_rounded"}',
    'modules': [
      {
        'name': 'Fundamentos da Computação',
        'description': 'Introdução aos conceitos básicos de computação, incluindo o funcionamento de computadores, componentes de hardware e software.',
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"computer_rounded"}',
        'questions': [
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a função principal da Unidade Central de Processamento (CPU)?',
            'alternatives': [
              'Armazenar dados temporariamente',
              'Executar operações aritméticas e lógicas',
              'Controlar a comunicação entre dispositivos',
              'Gerenciar o armazenamento permanente'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que é um algoritmo?',
            'alternatives': [
              'Um tipo de dado usado em programação',
              'Uma sequência de instruções para resolver um problema',
              'Um sistema operacional',
              'Uma linguagem de programação'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 9,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é o papel do sistema operacional em um computador?',
            'alternatives': [
              'Gerenciar as operações de entrada e saída',
              'Prover uma interface gráfica para o usuário',
              'Controlar o hardware e gerenciar recursos',
              'Controlar a execução dos programas'
            ],
            'correctAnswerIndex': 2,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que é a memória RAM em um computador?',
            'alternatives': [
              'Memória de longo prazo que guarda arquivos',
              'Memória volátil usada para armazenar dados temporários',
              'Memória permanente usada para armazenar o sistema operacional',
              'Memória usada para armazenar configurações de hardware'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 8,
            'xpReview': 2,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a principal função do software?',
            'alternatives': [
              'Realizar cálculos rápidos',
              'Controlar o funcionamento do hardware',
              'Executar algoritmos para resolver problemas',
              'Armazenar dados permanentemente'
            ],
            'correctAnswerIndex': 2,
            'xpInitial': 9,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a principal diferença entre software de sistema e software aplicativo?',
            'alternatives': [
              'O software de sistema é mais rápido que o software aplicativo',
              'O software de sistema é usado para controlar o hardware, enquanto o aplicativo é usado pelo usuário',
              'O software de sistema é mais caro',
              'Não há diferença significativa entre eles'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é o componente de um computador responsável por armazenar dados permanentemente?',
            'alternatives': [
              'Memória RAM',
              'HD (Disco rígido)',
              'CPU',
              'Placa-mãe'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que significa a sigla "URL"?',
            'alternatives': [
              'Uniform Resource Locator',
              'Universal Resource Locator',
              'Uniform Random Locator',
              'Universal Random Locator'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 8,
            'xpReview': 2,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual linguagem de programação é amplamente usada para desenvolvimento web?',
            'alternatives': [
              'Python',
              'JavaScript',
              'C++',
              'Java'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 9,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a função de um banco de dados em um sistema computacional?',
            'alternatives': [
              'Armazenar, organizar e gerenciar dados',
              'Controlar o funcionamento do sistema operacional',
              'Realizar cálculos matemáticos',
              'Gerenciar o tráfego de rede'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          }
        ],
      },
    ],
  },
  {
    'name': 'Cálculo para Computação',
    'description': 'Introdução aos conceitos de cálculo diferencial e integral aplicados à computação, incluindo limites, derivadas, integrais e suas aplicações.',
    'period': 1,
    'icon': '{"pack":"roundedMaterial","key":"functions_rounded"}',
    'modules': [
      {
        'name': 'Limites e Continuidade',
        'description': 'Fundamentos de limites e continuidade de funções, essenciais para entender o comportamento de funções em pontos críticos.',
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"equalizer_rounded"}',
        'questions': [
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é o limite de f(x) = x² quando x se aproxima de 2?',
            'alternatives': [
              '4',
              '2',
              '0',
              'Indefinido'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Quando uma função é contínua em um ponto?',
            'alternatives': [
              'Se o limite da função existe no ponto e é igual ao valor da função',
              'Se a derivada da função no ponto existe',
              'Se a função não possui assíntotas',
              'Se a função não possui valores negativos'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 11,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é o limite de f(x) = (x-1)/(x²-1) quando x se aproxima de 1?',
            'alternatives': [
              '1',
              'Indefinido',
              '0',
              'Infinito'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é o limite de f(x) = sin(x)/x quando x se aproxima de 0?',
            'alternatives': [
              '1',
              '0',
              'Indefinido',
              'Não existe'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 9,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é o limite de f(x) = 1/x quando x se aproxima de infinito?',
            'alternatives': [
              '0',
              '1',
              'Indefinido',
              'Infinito'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          }
        ],
      },
      {
        'name': 'Derivadas e Aplicações',
        'description': 'Estudo das derivadas de funções e suas aplicações, como o cálculo da taxa de variação e a otimização de funções.',
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"trending_up_rounded"}',
        'questions': [
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a derivada de f(x) = x²?',
            'alternatives': [
              '2x',
              'x',
              '2x²',
              'x²'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 12,
            'xpReview': 4,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a derivada de f(x) = sin(x)?',
            'alternatives': [
              'cos(x)',
              'sin(x)',
              '-sin(x)',
              'cos(x)²'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 11,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a interpretação geométrica da derivada de uma função?',
            'alternatives': [
              'A área sob a curva',
              'O ponto de máximo da função',
              'A inclinação da reta tangente à curva no ponto',
              'O valor de y para um dado x'
            ],
            'correctAnswerIndex': 2,
            'xpInitial': 12,
            'xpReview': 4,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a derivada de f(x) = e^x?',
            'alternatives': [
              'e^x',
              'x',
              '1',
              'ln(x)'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 12,
            'xpReview': 4,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a derivada de f(x) = ln(x)?',
            'alternatives': [
              '1/x',
              'x',
              'ln(x)',
              'e^x'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 11,
            'xpReview': 3,
            'isOfficial': true,
          }
        ],
      },
      {
        'name': 'Integrais e Aplicações',
        'description': 'Introdução às integrais definidas e indefinidas, e suas aplicações em áreas como cálculo de áreas e volumes.',
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"edit_rounded"}',
        'questions': [
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a integral indefinida de f(x) = x?',
            'alternatives': [
              'x²/2 + C',
              'x + C',
              '1/x + C',
              'ln(x) + C'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 12,
            'xpReview': 4,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a integral definida de f(x) = 1 entre os limites de 0 a 1?',
            'alternatives': [
              '1',
              '0',
              '0.5',
              'Indefinido'
            ],
            'correctAnswerIndex': 2,
            'xpInitial': 12,
            'xpReview': 4,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a aplicação comum das integrais em computação?',
            'alternatives': [
              'Cálculo de médias e totais',
              'Cálculo de derivadas de funções',
              'Otimização de funções',
              'Determinação de limites'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          }
        ],
      }
    ],
  },
  {
    'name': 'Sistemas Digitais',
    'description': 'Estudo de sistemas digitais, incluindo álgebra booleana, circuitos lógicos, codificação de sinais e implementação de sistemas computacionais.',
    'period': 3,
    'icon': '{"pack":"roundedMaterial","key":"settings_rounded"}',
    'modules': [
      {
        'name': 'Álgebra Booleana',
        'description': 'Fundamentos da álgebra booleana, operações lógicas, simplificação de expressões e circuitos lógicos.',
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"functions_rounded"}',
        'questions': [
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é o resultado da operação booleana A AND A?',
            'alternatives': [
              'A',
              '0',
              '1',
              'A OR A'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual expressão booleana representa a operação AND?',
            'alternatives': [
              'A + B',
              'A * B',
              'A AND B',
              'A OR B'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que é uma expressão booleana simplificada para A AND (A OR B)?',
            'alternatives': [
              'A',
              'A OR B',
              'A AND B',
              'A XOR B'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 11,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é o complemento de A + B?',
            'alternatives': [
              'A' + 'B',
              'A AND B',
              'A' + 'B',
              'NOT A AND NOT B'
            ],
            'correctAnswerIndex': 3,
            'xpInitial': 12,
            'xpReview': 4,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual das seguintes expressões booleanas é equivalente a (A OR B) AND (A OR C)?',
            'alternatives': [
              'A',
              'A OR B',
              'A OR (B AND C)',
              'A AND B'
            ],
            'correctAnswerIndex': 2,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          }
        ],
      },
      {
        'name': 'Circuitos Lógicos',
        'description': 'Construção e análise de circuitos lógicos combinacionais e sequenciais, como portas lógicas, flip-flops e multiplexadores.',
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"check_box_rounded"}',
        'questions': [
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual porta lógica gera o valor verdadeiro apenas quando as duas entradas são diferentes?',
            'alternatives': [
              'AND',
              'OR',
              'XOR',
              'NOT'
            ],
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
              'Um tipo de registro'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 12,
            'xpReview': 4,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a principal diferença entre circuitos combinacionais e sequenciais?',
            'alternatives': [
              'Circuitos sequenciais dependem de entradas anteriores, enquanto combinacionais não',
              'Circuitos sequenciais não têm entradas, enquanto combinacionais têm',
              'Circuitos combinacionais têm feedback, enquanto sequenciais não',
              'Circuitos sequenciais operam com portas AND, enquanto combinacionais operam com XOR'
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
              'Realizar a operação OR em várias entradas'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 11,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a saída de um circuito AND com entradas A = 1 e B = 0?',
            'alternatives': [
              '1',
              '0',
              'Indefinido',
              'Erro'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          }
        ],
      },
      {
        'name': 'Codificação de Sinais',
        'description': 'Técnicas de codificação e modulação de sinais digitais, incluindo conversão analógico-digital e digital-analógico.',
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"cast_connected_rounded"}',
        'questions': [
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que é a conversão de um sinal analógico para digital?',
            'alternatives': [
              'Modulação',
              'Codificação',
              'Amostragem',
              'Quantização'
            ],
            'correctAnswerIndex': 2,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a principal diferença entre codificação NRZ e RZ?',
            'alternatives': [
              'NRZ usa nível de tensão constante, enquanto RZ usa transições no meio de cada bit',
              'NRZ é mais eficiente em termos de largura de banda',
              'RZ é utilizado para sinais analógicos, enquanto NRZ é digital',
              'Não há diferença significativa'
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
              'A escolha do número de bits para representar o sinal',
              'A escolha do valor máximo para o sinal'
            ],
            'correctAnswerIndex': 2,
            'xpInitial': 12,
            'xpReview': 4,
            'isOfficial': true,
          }
        ],
      }
    ],
  },
  {
    'name': 'Paradigmas de Linguagens de Programação',
    'description': 'Estudo dos principais paradigmas de linguagens de programação, como programação imperativa, orientada a objetos, funcional e lógica.',
    'period': 4,
    'icon': '{"pack":"roundedMaterial","key":"code_rounded"}',
    'modules': [
      {
        'name': 'Programação Imperativa',
        'description': 'Conceitos de programação imperativa, variáveis, controle de fluxo, e estruturas de repetição e decisão.',
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"list_rounded"}',
        'questions': [
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é o principal objetivo da programação imperativa?',
            'alternatives': [
              'Declarar variáveis de maneira simples',
              'Descrever o que o programa faz, especificando passo a passo como deve ser feito',
              'Especificar o que deve ser feito sem se preocupar com o como',
              'Implementar as soluções de forma declarativa'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Em programação imperativa, o que representa uma variável?',
            'alternatives': [
              'Uma função que retorna um valor',
              'Um valor constante durante a execução do programa',
              'Um local na memória que armazena dados que podem ser alterados',
              'Uma expressão que calcula um valor'
            ],
            'correctAnswerIndex': 2,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual estrutura de controle de fluxo é usada para executar um bloco de código enquanto uma condição é verdadeira?',
            'alternatives': [
              'if',
              'switch',
              'while',
              'for'
            ],
            'correctAnswerIndex': 2,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual comando é usado em programação imperativa para interromper a execução de um loop?',
            'alternatives': [
              'continue',
              'break',
              'exit',
              'return'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Em uma linguagem imperativa, qual é o efeito do comando "return"?',
            'alternatives': [
              'Retorna o valor de uma função e encerra sua execução',
              'Cria uma nova variável',
              'Define o valor de uma variável',
              'Imprime um valor na tela'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          }
        ],
      },
      {
        'name': 'Programação Orientada a Objetos',
        'description': 'Conceitos de programação orientada a objetos, como classes, objetos, herança, polimorfismo e encapsulamento.',
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"widgets_rounded"}',
        'questions': [
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que é encapsulamento na programação orientada a objetos?',
            'alternatives': [
              'A habilidade de uma classe herdar características de outra classe',
              'A capacidade de uma classe alterar o comportamento de uma outra classe',
              'A restrição de acesso a dados e métodos dentro de uma classe',
              'O processo de combinar várias classes em uma única classe'
            ],
            'correctAnswerIndex': 2,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que é herança em programação orientada a objetos?',
            'alternatives': [
              'A capacidade de criar múltiplas instâncias de uma classe',
              'O processo de reutilizar código de uma classe base em uma classe derivada',
              'A restrição de acesso a dados e métodos dentro de uma classe',
              'O comportamento de um objeto ao executar um método'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que é polimorfismo na programação orientada a objetos?',
            'alternatives': [
              'A criação de novas instâncias de uma classe',
              'A capacidade de um método assumir diferentes formas, dependendo do tipo do objeto',
              'A restrição de acesso a métodos de uma classe',
              'O processo de criar uma classe a partir de outra classe'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que é um objeto na programação orientada a objetos?',
            'alternatives': [
              'Uma instância de uma classe que contém dados e comportamentos',
              'Uma função que retorna valores',
              'Um tipo de dado primitivo',
              'Uma variável que armazena uma referência'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Em programação orientada a objetos, o que é uma classe?',
            'alternatives': [
              'Um tipo de dado simples',
              'Uma coleção de objetos com comportamentos semelhantes',
              'Uma função que define o comportamento de um objeto',
              'Um módulo de código reutilizável'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          }
        ],
      },
      {
        'name': 'Programação Funcional',
        'description': 'Princípios da programação funcional, como funções puras, imutabilidade, recursão e funções de ordem superior.',
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"functions_rounded"}',
        'questions': [
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que caracteriza uma função pura na programação funcional?',
            'alternatives': [
              'Ela pode modificar o estado global',
              'Ela retorna sempre o mesmo valor para os mesmos parâmetros de entrada',
              'Ela altera os parâmetros de entrada',
              'Ela não pode ser chamada dentro de outras funções'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que é imutabilidade na programação funcional?',
            'alternatives': [
              'A capacidade de alterar variáveis durante a execução',
              'A incapacidade de modificar o valor de uma variável depois que ela foi definida',
              'A habilidade de criar funções com efeitos colaterais',
              'A criação de tipos de dados complexos'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que é uma função de ordem superior?',
            'alternatives': [
              'Uma função que recebe como parâmetros ou retorna outras funções',
              'Uma função que altera variáveis globais',
              'Uma função que tem efeitos colaterais',
              'Uma função que não recebe parâmetros'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          }
        ],
      }
    ],
  },
  {
    'name': 'Redes de Computadores',
    'description': 'Estudo dos conceitos fundamentais de redes de computadores, incluindo topologias, protocolos, comunicação, e tecnologias de redes.',
    'period': 5,
    'icon': '{"pack":"roundedMaterial","key":"network_wifi_rounded"}',
    'modules': [
      {
        'name': 'Fundamentos de Redes',
        'description': 'Conceitos básicos de redes de computadores, incluindo tipos de redes, topologias e camadas de comunicação.',
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"wifi_rounded"}',
        'questions': [
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual a principal função da camada de enlace no modelo OSI?',
            'alternatives': [
              'Gerenciar a comunicação entre dispositivos em redes locais',
              'Endereçar pacotes de dados para entrega final',
              'Gerenciar o roteamento de pacotes entre redes',
              'Estabelecer conexões de transporte de dados entre hosts'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual das seguintes topologias é mais resistente a falhas?',
            'alternatives': [
              'Estrela',
              'Barramento',
              'Anel',
              'Malha'
            ],
            'correctAnswerIndex': 3,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a principal diferença entre redes LAN e WAN?',
            'alternatives': [
              'LAN cobre uma área geograficamente ampla, enquanto WAN cobre uma área local',
              'LAN é usada para comunicação sem fio, enquanto WAN utiliza cabos',
              'LAN é uma rede de área local, enquanto WAN é uma rede de longa distância',
              'LAN é limitada a dispositivos móveis, enquanto WAN conecta apenas computadores de mesa'
            ],
            'correctAnswerIndex': 2,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que significa "latência" em redes de computadores?',
            'alternatives': [
              'A velocidade de transmissão de dados',
              'O tempo de resposta de um pacote de dados entre dispositivos',
              'A quantidade de dados que podem ser transmitidos simultaneamente',
              'A capacidade de armazenamento de uma rede'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual protocolo é responsável pelo envio de pacotes na camada de transporte?',
            'alternatives': [
              'IP',
              'TCP',
              'HTTP',
              'Ethernet'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          }
        ],
      },
      {
        'name': 'Protocolos de Comunicação',
        'description': 'Estudo dos protocolos de comunicação utilizados para a troca de informações entre dispositivos em redes de computadores.',
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"dns_rounded"}',
        'questions': [
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual protocolo é utilizado para resolver nomes de domínio em endereços IP?',
            'alternatives': [
              'DNS',
              'TCP',
              'HTTP',
              'ARP'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a principal função do protocolo TCP?',
            'alternatives': [
              'Gerenciar a distribuição de endereços IP',
              'Garantir a entrega confiável de dados entre sistemas',
              'Encaminhar pacotes entre diferentes redes',
              'Controlar o tráfego de rede em tempo real'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que o protocolo HTTP faz?',
            'alternatives': [
              'Define regras para comunicação entre roteadores',
              'Permite a comunicação entre servidores web e clientes',
              'Realiza a atribuição de endereços IP dinâmicos',
              'Estabelece uma conexão segura entre redes'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que significa a sigla "IP" em redes de computadores?',
            'alternatives': [
              'Internet Protocol',
              'Internet Point',
              'Internal Packet',
              'Interconnected Path'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a principal função do protocolo ARP?',
            'alternatives': [
              'Atribuir endereços IP a dispositivos de rede',
              'Resgatar endereços MAC de dispositivos a partir de endereços IP',
              'Gerenciar a comunicação entre redes diferentes',
              'Encaminhar pacotes de dados através de roteadores'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          }
        ],
      },
      {
        'name': 'Tecnologias de Redes',
        'description': 'Exploração das tecnologias e equipamentos utilizados em redes de computadores, como switches, roteadores, e acesso sem fio.',
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"devices_rounded"}',
        'questions': [
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que é um roteador?',
            'alternatives': [
              'Dispositivo que conecta redes locais e realiza o encaminhamento de pacotes entre elas',
              'Dispositivo que conecta um computador a uma rede sem fio',
              'Dispositivo usado para ampliar o alcance de uma rede local',
              'Dispositivo que monitora o tráfego de rede em tempo real'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a função de um switch em uma rede local?',
            'alternatives': [
              'Encaminhar pacotes entre diferentes redes',
              'Encaminhar pacotes para os dispositivos dentro de uma rede local',
              'Distribuir endereços IP para dispositivos',
              'Gerenciar a comunicação sem fio entre dispositivos'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a principal vantagem de uma rede sem fio?',
            'alternatives': [
              'Maior velocidade de transmissão',
              'Facilidade de expansão e mobilidade',
              'Maior segurança em comparação com redes cabeadas',
              'Capacidade de conectar mais dispositivos simultaneamente'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual dispositivo é usado para interligar redes de diferentes tipos e permitir a comunicação entre elas?',
            'alternatives': [
              'Switch',
              'Hub',
              'Gateway',
              'Repeater'
            ],
            'correctAnswerIndex': 2,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que caracteriza a tecnologia de redes Wi-Fi?',
            'alternatives': [
              'Utiliza fios para transmitir dados',
              'Permite conexões rápidas, mas de curta distância',
              'É uma tecnologia de comunicação sem fio que usa ondas de rádio',
              'Apenas oferece conectividade para dispositivos móveis'
            ],
            'correctAnswerIndex': 2,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          }
        ],
      }
    ],
  },
  {
    'name': 'Computação Gráfica',
    'description': 'Estudo dos conceitos fundamentais de computação gráfica, incluindo modelagem, renderização e animação de objetos 2D e 3D.',
    'period': 6,
    'icon': '{"pack":"roundedMaterial","key":"photo_rounded"}',
    'modules': [
      {
        'name': 'Fundamentos de Computação Gráfica',
        'description': 'Conceitos básicos de computação gráfica, incluindo pixels, resoluções, espaço de cores e manipulação de imagens.',
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"camera_alt_rounded"}',
        'questions': [
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que é um pixel em computação gráfica?',
            'alternatives': [
              'A menor unidade de uma imagem digital',
              'Uma técnica de modelagem de objetos 3D',
              'A cor predominante de uma imagem',
              'A resolução máxima de uma tela'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a principal diferença entre uma imagem raster e uma imagem vetorial?',
            'alternatives': [
              'Imagens raster são compostas por pixels, enquanto imagens vetoriais são compostas por formas geométricas',
              'Imagens raster são geradas por computação gráfica, enquanto imagens vetoriais são sempre feitas à mão',
              'Imagens raster têm maior qualidade, enquanto imagens vetoriais têm uma qualidade limitada',
              'Imagens vetoriais não podem ser ampliadas, enquanto imagens raster podem'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a finalidade da técnica de anti-aliasing em gráficos computacionais?',
            'alternatives': [
              'Reduzir o tamanho do arquivo de imagem',
              'Aprimorar a aparência das bordas, suavizando as transições entre pixels',
              'Adicionar sombras e reflexos em objetos 3D',
              'Aumentar a velocidade de renderização das imagens'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Em que tipo de gráfico a técnica de "mapping" é mais utilizada?',
            'alternatives': [
              'Gráficos 3D',
              'Gráficos 2D',
              'Gráficos vetoriais',
              'Gráficos de texto'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que é mapeamento de textura em gráficos 3D?',
            'alternatives': [
              'Aplicar uma imagem 2D sobre a superfície de um objeto 3D',
              'Alterar as cores de um objeto 3D para melhorar o brilho',
              'Desenhar a geometria de um objeto em um software de modelagem',
              'Ajustar a escala de um modelo 3D'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 10,
            'xpReview': 3,
            'isOfficial': true,
          }
        ],
      },
      {
        'name': 'Modelagem 3D',
        'description': 'Estudo da criação e manipulação de objetos 3D, incluindo primitivas geométricas, transformação de objetos e técnicas de modelagem.',
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"3d_rotation_rounded"}',
        'questions': [
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a principal diferença entre modelagem 3D por malha e modelagem 3D por NURBS?',
            'alternatives': [
              'Malha 3D utiliza polígonos, enquanto NURBS utiliza curvas matemáticas para definir formas',
              'Malha 3D é mais adequada para superfícies suaves, enquanto NURBS é usada para superfícies duras',
              'Modelagem por malha permite maior controle sobre detalhes, enquanto NURBS é mais fácil de usar',
              'NURBS não pode ser usada para objetos 3D, apenas para objetos 2D'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 12,
            'xpReview': 4,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que é uma "transformação" em gráficos 3D?',
            'alternatives': [
              'Alteração da cor de um objeto',
              'Mudança na posição, escala ou rotação de um objeto no espaço 3D',
              'Mudança no tipo de sombreamento de um objeto',
              'Ajuste da resolução de uma textura'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 12,
            'xpReview': 4,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é o objetivo da técnica de "culling" em gráficos 3D?',
            'alternatives': [
              'Desenhar apenas os objetos visíveis na cena para otimizar o desempenho',
              'Adicionar texturas de alta resolução aos objetos 3D',
              'Aplicar sombra aos objetos 3D para maior realismo',
              'Definir a posição da câmera na cena'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 12,
            'xpReview': 4,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que caracteriza um modelo 3D com "normais"?',
            'alternatives': [
              'Uma técnica de iluminação usada para simular reflexões',
              'Direção de cada face de um objeto 3D para determinar como a luz interage com ele',
              'Uma técnica de compressão de arquivos 3D para otimizar o desempenho',
              'Forma de texturizar modelos 3D com mapeamento de imagem'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 12,
            'xpReview': 4,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Em modelagem 3D, o que são "vertices"?',
            'alternatives': [
              'Pontos onde as arestas de um objeto 3D se encontram',
              'As linhas que formam a estrutura de um objeto 3D',
              'Imagens que são aplicadas sobre a superfície de um objeto 3D',
              'Os materiais que definem o brilho de um objeto 3D'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 12,
            'xpReview': 4,
            'isOfficial': true,
          }
        ],
      },
      {
        'name': 'Renderização de Imagens',
        'description': 'Estudo dos processos de renderização, incluindo sombreamento, iluminação e algoritmos de rastreamento de raios.',
        'isOfficial': true,
        'icon': '{"pack":"roundedMaterial","key":"camera_enhance_rounded"}',
        'questions': [
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é o objetivo do algoritmo de rastreamento de raios em computação gráfica?',
            'alternatives': [
              'Simular a trajetória da luz para gerar imagens realistas',
              'Criar modelos 3D a partir de imagens 2D',
              'Aplicar texturas em objetos 3D',
              'Desenhar linhas e formas geométricas simples'
            ],
            'correctAnswerIndex': 0,
            'xpInitial': 14,
            'xpReview': 5,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'O que é "sombras suaves" em gráficos computacionais?',
            'alternatives': [
              'Sombras que são projetadas por objetos com bordas nítidas',
              'Sombras que são projetadas por objetos com bordas difusas ou suaves',
              'Sombras projetadas apenas por luzes pontuais',
              'Sombras que desaparecem após uma distância específica'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 14,
            'xpReview': 5,
            'isOfficial': true,
          },
          {
            'type': QuestionType.multipleChoice,
            'statement': 'Qual é a técnica de iluminação usada para simular a luz que reflete de superfícies metálicas?',
            'alternatives': [
              'Iluminação ambiente',
              'Iluminação especular',
              'Iluminação difusa',
              'Iluminação reflexiva'
            ],
            'correctAnswerIndex': 1,
            'xpInitial': 14,
            'xpReview': 5,
            'isOfficial': true,
          }
        ],
      }
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
