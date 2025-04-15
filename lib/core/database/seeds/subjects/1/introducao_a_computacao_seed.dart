import 'package:bcc_review_app/domain/entities/question.dart';

final Map<String, dynamic> introducaoAComputacaoSeedData = {
  'name': 'Introdução à Computação',
  'description':
      'Fundamentos da computação, incluindo conceitos de hardware, software, sistemas operacionais, e algoritmos básicos.',
  'period': 1,
  'icon': '{"pack":"roundedMaterial","key":"computer_rounded"}',
  'modules': [
    {
      'name': 'Fundamentos da Computação',
      'description':
          'Introdução aos conceitos básicos de computação, incluindo o funcionamento de computadores, componentes de hardware e software.',
      'isOfficial': true,
      'icon': '{"pack":"roundedMaterial","key":"computer_rounded"}',
      'questions': [
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é a função principal da Unidade Central de Processamento (CPU)?',
          'alternatives': [
            'Armazenar dados temporariamente',
            'Executar operações aritméticas e lógicas',
            'Controlar a comunicação entre dispositivos',
            'Gerenciar o armazenamento permanente',
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
            'Uma linguagem de programação',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 9,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é o papel do sistema operacional em um computador?',
          'alternatives': [
            'Gerenciar as operações de entrada e saída',
            'Prover uma interface gráfica para o usuário',
            'Controlar o hardware e gerenciar recursos',
            'Controlar a execução dos programas',
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
            'Memória usada para armazenar configurações de hardware',
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
            'Armazenar dados permanentemente',
          ],
          'correctAnswerIndex': 2,
          'xpInitial': 9,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é a principal diferença entre software de sistema e software aplicativo?',
          'alternatives': [
            'O software de sistema é mais rápido que o software aplicativo',
            'O software de sistema é usado para controlar o hardware, enquanto o aplicativo é usado pelo usuário',
            'O software de sistema é mais caro',
            'Não há diferença significativa entre eles',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é o componente de um computador responsável por armazenar dados permanentemente?',
          'alternatives': [
            'Memória RAM',
            'HD (Disco rígido)',
            'CPU',
            'Placa-mãe',
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
            'Universal Random Locator',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 8,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual linguagem de programação é amplamente usada para desenvolvimento web?',
          'alternatives': ['Python', 'JavaScript', 'C++', 'Java'],
          'correctAnswerIndex': 1,
          'xpInitial': 9,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é a função de um banco de dados em um sistema computacional?',
          'alternatives': [
            'Armazenar, organizar e gerenciar dados',
            'Controlar o funcionamento do sistema operacional',
            'Realizar cálculos matemáticos',
            'Gerenciar o tráfego de rede',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 3,
          'isOfficial': true,
        },
      ],
    },
  ],
};
