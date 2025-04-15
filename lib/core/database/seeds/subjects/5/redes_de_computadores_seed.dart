import 'package:bcc_review_app/domain/entities/question.dart';

final Map<String, dynamic> redesDeComputadoresSeedData = {
  'name': 'Redes de Computadores',
  'description':
      'Estudo dos conceitos fundamentais de redes de computadores, incluindo topologias, protocolos, comunicação, e tecnologias de redes.',
  'period': 5,
  'icon': '{"pack":"roundedMaterial","key":"network_wifi_rounded"}',
  'modules': [
    {
      'name': 'Fundamentos de Redes',
      'description':
          'Conceitos básicos de redes de computadores, incluindo tipos de redes, topologias e camadas de comunicação.',
      'isOfficial': true,
      'icon': '{"pack":"roundedMaterial","key":"wifi_rounded"}',
      'questions': [
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual a principal função da camada de enlace no modelo OSI?',
          'alternatives': [
            'Gerenciar a comunicação entre dispositivos em redes locais',
            'Endereçar pacotes de dados para entrega final',
            'Gerenciar o roteamento de pacotes entre redes',
            'Estabelecer conexões de transporte de dados entre hosts',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual das seguintes topologias é mais resistente a falhas?',
          'alternatives': ['Estrela', 'Barramento', 'Anel', 'Malha'],
          'correctAnswerIndex': 3,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual é a principal diferença entre redes LAN e WAN?',
          'alternatives': [
            'LAN cobre uma área geograficamente ampla, enquanto WAN cobre uma área local',
            'LAN é usada para comunicação sem fio, enquanto WAN utiliza cabos',
            'LAN é uma rede de área local, enquanto WAN é uma rede de longa distância',
            'LAN é limitada a dispositivos móveis, enquanto WAN conecta apenas computadores de mesa',
          ],
          'correctAnswerIndex': 2,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'O que significa "latência" em redes de computadores?',
          'alternatives': [
            'A velocidade de transmissão de dados',
            'O tempo de resposta de um pacote de dados entre dispositivos',
            'A quantidade de dados que podem ser transmitidos simultaneamente',
            'A capacidade de armazenamento de uma rede',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual protocolo é responsável pelo envio de pacotes na camada de transporte?',
          'alternatives': ['IP', 'TCP', 'HTTP', 'Ethernet'],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
      ],
    },
    {
      'name': 'Protocolos de Comunicação',
      'description':
          'Estudo dos protocolos de comunicação utilizados para a troca de informações entre dispositivos em redes de computadores.',
      'isOfficial': true,
      'icon': '{"pack":"roundedMaterial","key":"dns_rounded"}',
      'questions': [
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual protocolo é utilizado para resolver nomes de domínio em endereços IP?',
          'alternatives': ['DNS', 'TCP', 'HTTP', 'ARP'],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual é a principal função do protocolo TCP?',
          'alternatives': [
            'Gerenciar a distribuição de endereços IP',
            'Garantir a entrega confiável de dados entre sistemas',
            'Encaminhar pacotes entre diferentes redes',
            'Controlar o tráfego de rede em tempo real',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'O que o protocolo HTTP faz?',
          'alternatives': [
            'Define regras para comunicação entre roteadores',
            'Permite a comunicação entre servidores web e clientes',
            'Realiza a atribuição de endereços IP dinâmicos',
            'Estabelece uma conexão segura entre redes',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'O que significa a sigla "IP" em redes de computadores?',
          'alternatives': [
            'Internet Protocol',
            'Internet Point',
            'Internal Packet',
            'Interconnected Path',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual é a principal função do protocolo ARP?',
          'alternatives': [
            'Atribuir endereços IP a dispositivos de rede',
            'Resgatar endereços MAC de dispositivos a partir de endereços IP',
            'Gerenciar a comunicação entre redes diferentes',
            'Encaminhar pacotes de dados através de roteadores',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
      ],
    },
    {
      'name': 'Tecnologias de Redes',
      'description':
          'Exploração das tecnologias e equipamentos utilizados em redes de computadores, como switches, roteadores, e acesso sem fio.',
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
            'Dispositivo que monitora o tráfego de rede em tempo real',
          ],
          'correctAnswerIndex': 0,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual é a função de um switch em uma rede local?',
          'alternatives': [
            'Encaminhar pacotes entre diferentes redes',
            'Encaminhar pacotes para os dispositivos dentro de uma rede local',
            'Distribuir endereços IP para dispositivos',
            'Gerenciar a comunicação sem fio entre dispositivos',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'Qual é a principal vantagem de uma rede sem fio?',
          'alternatives': [
            'Maior velocidade de transmissão',
            'Facilidade de expansão e mobilidade',
            'Maior segurança em comparação com redes cabeadas',
            'Capacidade de conectar mais dispositivos simultaneamente',
          ],
          'correctAnswerIndex': 1,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement':
              'Qual dispositivo é usado para interligar redes de diferentes tipos e permitir a comunicação entre elas?',
          'alternatives': ['Switch', 'Hub', 'Gateway', 'Repeater'],
          'correctAnswerIndex': 2,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
        {
          'type': QuestionType.multipleChoice,
          'statement': 'O que caracteriza a tecnologia de redes Wi-Fi?',
          'alternatives': [
            'Utiliza fios para transmitir dados',
            'Permite conexões rápidas, mas de curta distância',
            'É uma tecnologia de comunicação sem fio que usa ondas de rádio',
            'Apenas oferece conectividade para dispositivos móveis',
          ],
          'correctAnswerIndex': 2,
          'xpInitial': 10,
          'xpReview': 2,
          'isOfficial': true,
        },
      ],
    },
  ],
};
