import 'package:bcc_review_app/domain/entities/question.dart';

final Map<String, dynamic> paradigmasDeLinguagensDeProgramacaoSeedData = {
  'name': 'Paradigmas de Linguagens de Programação',
  'description':
      'Estudo dos principais paradigmas de linguagens de programação, como programação imperativa, orientada a objetos, funcional e lógica.',
  'period': 4,
  'icon': '{"pack":"roundedMaterial","key":"code_rounded"}',
  'modules': [
    {
      'name': 'Programação Imperativa',
      'description':
          'Conceitos de programação imperativa, variáveis, controle de fluxo, e estruturas de repetição e decisão.',
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
            'Implementar as soluções de forma declarativa',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Em programação imperativa, o que representa uma variável?',
          'alternatives': [
            'Uma função que retorna um valor',
            'Um valor constante durante a execução do programa',
            'Um local na memória que armazena dados que podem ser alterados',
            'Uma expressão que calcula um valor',
          ],
          'correctAnswerIndex': 2,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual estrutura de controle de fluxo é usada para executar um bloco de código enquanto uma condição é verdadeira?',
          'alternatives': ['if', 'switch', 'while', 'for'],
          'correctAnswerIndex': 2,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual comando é usado em programação imperativa para interromper a execução de um loop?',
          'alternatives': ['continue', 'break', 'exit', 'return'],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Em uma linguagem imperativa, qual é o efeito do comando "return"?',
          'alternatives': [
            'Retorna o valor de uma função e encerra sua execução',
            'Cria uma nova variável',
            'Define o valor de uma variável',
            'Imprime um valor na tela',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
      ],
    },
    {
      'name': 'Programação Orientada a Objetos',
      'description':
          'Conceitos de programação orientada a objetos, como classes, objetos, herança, polimorfismo e encapsulamento.',
      'isOfficial': true,
      'icon': '{"pack":"roundedMaterial","key":"widgets_rounded"}',
      'questions': [
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'O que é encapsulamento na programação orientada a objetos?',
          'alternatives': [
            'A habilidade de uma classe herdar características de outra classe',
            'A capacidade de uma classe alterar o comportamento de uma outra classe',
            'A restrição de acesso a dados e métodos dentro de uma classe',
            'O processo de combinar várias classes em uma única classe',
          ],
          'correctAnswerIndex': 2,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'O que é herança em programação orientada a objetos?',
          'alternatives': [
            'A capacidade de criar múltiplas instâncias de uma classe',
            'O processo de reutilizar código de uma classe base em uma classe derivada',
            'A restrição de acesso a dados e métodos dentro de uma classe',
            'O comportamento de um objeto ao executar um método',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'O que é polimorfismo na programação orientada a objetos?',
          'alternatives': [
            'A criação de novas instâncias de uma classe',
            'A capacidade de um método assumir diferentes formas, dependendo do tipo do objeto',
            'A restrição de acesso a métodos de uma classe',
            'O processo de criar uma classe a partir de outra classe',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'O que é um objeto na programação orientada a objetos?',
          'alternatives': [
            'Uma instância de uma classe que contém dados e comportamentos',
            'Uma função que retorna valores',
            'Um tipo de dado primitivo',
            'Uma variável que armazena uma referência',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Em programação orientada a objetos, o que é uma classe?',
          'alternatives': [
            'Um tipo de dado simples',
            'Uma coleção de objetos com comportamentos semelhantes',
            'Uma função que define o comportamento de um objeto',
            'Um módulo de código reutilizável',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
      ],
    },
    {
      'name': 'Programação Funcional',
      'description':
          'Princípios da programação funcional, como funções puras, imutabilidade, recursão e funções de ordem superior.',
      'isOfficial': true,
      'icon': '{"pack":"roundedMaterial","key":"functions_rounded"}',
      'questions': [
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'O que caracteriza uma função pura na programação funcional?',
          'alternatives': [
            'Ela pode modificar o estado global',
            'Ela retorna sempre o mesmo valor para os mesmos parâmetros de entrada',
            'Ela altera os parâmetros de entrada',
            'Ela não pode ser chamada dentro de outras funções',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'O que é imutabilidade na programação funcional?',
          'alternatives': [
            'A capacidade de alterar variáveis durante a execução',
            'A incapacidade de modificar o valor de uma variável depois que ela foi definida',
            'A habilidade de criar funções com efeitos colaterais',
            'A criação de tipos de dados complexos',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'O que é uma função de ordem superior?',
          'alternatives': [
            'Uma função que recebe como parâmetros ou retorna outras funções',
            'Uma função que altera variáveis globais',
            'Uma função que tem efeitos colaterais',
            'Uma função que não recebe parâmetros',
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
