import 'package:flutter/material.dart';

class QuizVictoryState extends StatelessWidget {
  final int totalXPEarned;
  final VoidCallback onRetry;
  final VoidCallback onBackToModules;

  const QuizVictoryState({
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
            'Parabéns!',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.green[700],
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Icon(Icons.emoji_events, size: 80, color: Colors.amber[600]),
          const SizedBox(height: 16),
          Text(
            'Você completou o quiz!',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'XP Total: $totalXPEarned',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: FilledButton(
                  onPressed: onBackToModules,
                  child: const Text('Concluir'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
