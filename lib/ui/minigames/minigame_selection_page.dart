import 'package:flutter/material.dart';

class MinigameSelectionPage extends StatelessWidget {
  const MinigameSelectionPage({super.key});

  //Lista de Minijogos
  final List<Map<String, String>> minigames = const [
    {'name': 'Cobrinha 0/1', 'image': 'assets/images/minigame-1-icon.png'},
    {'name': 'Forca', 'image': 'assets/images/minigame-2-icon.png'},
    {'name': 'Jogo da Velha', 'image': 'assets/images/minigame-3-icon.png'},
    {'name': 'Tênis de Mesa', 'image': 'assets/images/minigame-4-icon.png'},
    {'name': 'Soma Saga', 'image': 'assets/images/minigame-5-icon.png'},
    {'name': 'Palavras Cruzadas', 'image': 'assets/images/minigame-6-icon.png'},
    {'name': 'Arranha-Céu', 'image': 'assets/images/minigame-7-icon.png'},
    {'name': 'Dividir e Conquistar', 'image': 'assets/images/minigame-8-icon.png'},
    {'name': 'Memorização', 'image': 'assets/images/minigame-9-icon.png'},
  ];

  //Mapa da Descrição dos Minijogos
  final Map<String, String> descriptions = const {
    'Cobrinha 0/1': 'Desvie dos obstáculos e coma os pontos para crescer!',
    'Forca': 'Adivinhe a palavra antes que o boneco seja enforcado.',
    'Jogo da Velha': 'Desafie o computador ou um amigo em partidas rápidas.',
    'Tênis de Mesa': 'Reaja rápido e marque pontos neste jogo de reflexo.',
    'Soma Saga': 'Resolva somas antes do tempo acabar!',
    'Palavras Cruzadas': 'Complete as palavras com dicas inteligentes.',
    'Arranha-Céu': 'Monte os prédios na ordem certa sem pistas diretas.',
    'Dividir e Conquistar': 'Quebre o problema em partes e vença etapas.',
    'Memorização': 'Teste sua memória com padrões visuais rápidos.',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escolha um Minijogo')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          children: minigames.map((minigame) {
            return GestureDetector(
              onTap: () {
                showMinigameDialog(
                  context,
                  minigame['name']!,
                  minigame['image']!,
                  descriptions[minigame['name']] ?? 'Descrição indisponível.',
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          minigame['image']!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      minigame['name']!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void showMinigameDialog(
      BuildContext context,
      String name,
      String imagePath,
      String description,
      ) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              // Linha com botão de fechar alinhado à direita
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              //Conteúdo da Descrição do Jogo + Botão de Jogar
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(imagePath, height: 100),
                    const SizedBox(height: 16),
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.play_arrow),
                      label: const Text("Jogar"),
                      onPressed: () {
                        Navigator.of(context).pop();
                        // Aqui chamaremos a navegação para o jogo
                        // Routefly.push('/minigames/[id]/game');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
