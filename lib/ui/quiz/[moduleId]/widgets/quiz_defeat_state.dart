import 'package:flutter/material.dart';

class QuizDefeatState extends StatelessWidget {
  final int totalXPEarned;
  final VoidCallback onRetry;
  final VoidCallback onBackToModules;

  const QuizDefeatState({
    super.key,
    required this.totalXPEarned,
    required this.onRetry,
    required this.onBackToModules,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Fim de Jogo!', // Título específico para derrota
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color:
                  Theme.of(context).colorScheme.error, // Cor temática de erro
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Icon(
            Icons.heart_broken, // Ícone de coração partido
            size: 80,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            'Você perdeu todas as vidas.',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextButton(
                  onPressed: onBackToModules,
                  child: const Text('Voltar aos Módulos'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: FilledButton(
                  onPressed: onRetry,
                  child: const Text('Tentar Novamente'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
