// lib/minigames/snake/snake_game_page.dart

import 'package:flutter/material.dart';
import 'snake_game_widget.dart';

class SnakeGamePage extends StatelessWidget {
  const SnakeGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cobrinha 0/1')),
      body: const SnakeGameWidget(),
    );
  }
}
