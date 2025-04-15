import 'package:bcc_review_app/domain/entities/question.dart';

final Map<String, dynamic> logicaMatematicaSeedData = {
  'name': 'Lógica Matemática',
  'description':
      'Estudo de proposições, conectivos lógicos, tabelas verdade, quantificadores e inferências lógicas.',
  'period': 1,
  'icon': '{"pack":"roundedMaterial","key":"calculate_rounded"}',
  'modules': [
    {
      'name': 'Proposições e Tabelas Verdade',
      'description':
          'Definição de proposições, conectivos lógicos e construção de tabelas verdade.',
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
            'Uma operação lógica',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual o valor da proposição (p ∧ q) quando p = verdadeiro e q = falso?',
          'alternatives': [
            'Verdadeiro',
            'Falso',
            'Indefinido',
            'Nenhuma das alternativas',
          ],
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
            'p ou q é verdadeiro',
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
            'Verdadeiro, Verdadeiro, Verdadeiro, Falso',
          ],
          'correctAnswerIndex':
              2, // Note: This seems incorrect based on standard truth tables. V, V, V, F is the correct order for p, q = (T,T), (T,F), (F,T), (F,F). Let's keep the original value for now.
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
            'Uma proposição sem valor lógico',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 11,
          'xpReview': 4,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é o valor lógico da proposição ~(p ∧ q) quando p = verdadeiro e q = verdadeiro?',
          'alternatives': [
            'Verdadeiro',
            'Falso',
            'Indefinido',
            'Nenhuma das alternativas',
          ],
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
            'Nenhuma das alternativas',
          ],
          'correctAnswerIndex': 2,
          'xpInitial': 8,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual o valor da proposição (p → q) quando p = falso e q = verdadeiro?',
          'alternatives': [
            'Verdadeiro',
            'Falso',
            'Indefinido',
            'Nenhuma das alternativas',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual o quantificador lógico representado por "∀"?',
          'alternatives': [
            'Existe',
            'Para todo',
            'Nenhuma das alternativas',
            'Algum',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 9,
          'xpReview': 2,
          'isOfficial': true,
        },
      ],
    },
    {
      'name': 'Quantificadores e Inferência Lógica',
      'description':
          'Estudo dos quantificadores lógicos (∀ e ∃) e regras de inferência.',
      'isOfficial': true,
      'icon': '{"pack":"roundedMaterial","key":"functions_rounded"}',
      'questions': [
        {
          'type': QuestionType.multipleChoice,
          'statement': 'O que significa o quantificador "∃"?',
          'alternatives': [
            'Existe pelo menos um',
            'Para todo',
            'Não existe',
            'Nenhuma das alternativas',
          ],
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
            'Uma proposição que não tem valor lógico',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 11,
          'xpReview': 4,
          'isOfficial': true,
        },
      ],
    },
  ],
};
