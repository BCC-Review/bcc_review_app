import 'package:bcc_review_app/domain/entities/question.dart';

final Map<String, dynamic> computacaoGraficaSeedData = {
  'name': 'Computação Gráfica',
  'description':
      'Estudo dos conceitos fundamentais de computação gráfica, incluindo modelagem, renderização e animação de objetos 2D e 3D.',
  'period': 6,
  'icon': '{"pack":"roundedMaterial","key":"photo_rounded"}',
  'modules': [
    {
      'name': 'Fundamentos de Computação Gráfica',
      'description':
          'Conceitos básicos de computação gráfica, incluindo pixels, resoluções, espaço de cores e manipulação de imagens.',
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
            'A resolução máxima de uma tela',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é a principal diferença entre uma imagem raster e uma imagem vetorial?',
          'alternatives': [
            'Imagens raster são compostas por pixels, enquanto imagens vetoriais são compostas por formas geométricas',
            'Imagens raster são geradas por computação gráfica, enquanto imagens vetoriais são sempre feitas à mão',
            'Imagens raster têm maior qualidade, enquanto imagens vetoriais têm uma qualidade limitada',
            'Imagens vetoriais não podem ser ampliadas, enquanto imagens raster podem',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é a finalidade da técnica de anti-aliasing em gráficos computacionais?',
          'alternatives': [
            'Reduzir o tamanho do arquivo de imagem',
            'Aprimorar a aparência das bordas, suavizando as transições entre pixels',
            'Adicionar sombras e reflexos em objetos 3D',
            'Aumentar a velocidade de renderização das imagens',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 3,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Em que tipo de gráfico a técnica de "mapping" é mais utilizada?',
          'alternatives': [
            'Gráficos 3D',
            'Gráficos 2D',
            'Gráficos vetoriais',
            'Gráficos de texto',
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
            'Ajustar a escala de um modelo 3D',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 3,
          'isOfficial': true,
        },
      ],
    },
    {
      'name': 'Modelagem 3D',
      'description':
          'Estudo da criação e manipulação de objetos 3D, incluindo primitivas geométricas, transformação de objetos e técnicas de modelagem.',
      'isOfficial': true,
      'icon': '{"pack":"roundedMaterial","key":"3d_rotation_rounded"}',
      'questions': [
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é a principal diferença entre modelagem 3D por malha e modelagem 3D por NURBS?',
          'alternatives': [
            'Malha 3D utiliza polígonos, enquanto NURBS utiliza curvas matemáticas para definir formas',
            'Malha 3D é mais adequada para superfícies suaves, enquanto NURBS é usada para superfícies duras',
            'Modelagem por malha permite maior controle sobre detalhes, enquanto NURBS é mais fácil de usar',
            'NURBS não pode ser usada para objetos 3D, apenas para objetos 2D',
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
            'Ajuste da resolução de uma textura',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 12,
          'xpReview': 4,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é o objetivo da técnica de "culling" em gráficos 3D?',
          'alternatives': [
            'Desenhar apenas os objetos visíveis na cena para otimizar o desempenho',
            'Adicionar texturas de alta resolução aos objetos 3D',
            'Aplicar sombra aos objetos 3D para maior realismo',
            'Definir a posição da câmera na cena',
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
            'Forma de texturizar modelos 3D com mapeamento de imagem',
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
            'Os materiais que definem o brilho de um objeto 3D',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 12,
          'xpReview': 4,
          'isOfficial': true,
        },
      ],
    },
    {
      'name': 'Renderização de Imagens',
      'description':
          'Estudo dos processos de renderização, incluindo sombreamento, iluminação e algoritmos de rastreamento de raios.',
      'isOfficial': true,
      'icon': '{"pack":"roundedMaterial","key":"camera_enhance_rounded"}',
      'questions': [
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é o objetivo do algoritmo de rastreamento de raios em computação gráfica?',
          'alternatives': [
            'Simular a trajetória da luz para gerar imagens realistas',
            'Criar modelos 3D a partir de imagens 2D',
            'Aplicar texturas em objetos 3D',
            'Desenhar linhas e formas geométricas simples',
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
            'Sombras que desaparecem após uma distância específica',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 14,
          'xpReview': 5,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual é a técnica de iluminação usada para simular a luz que reflete de superfícies metálicas?',
          'alternatives': [
            'Iluminação ambiente',
            'Iluminação especular',
            'Iluminação difusa',
            'Iluminação reflexiva',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 14,
          'xpReview': 5,
          'isOfficial': true,
        },
      ],
    },
  ],
};
