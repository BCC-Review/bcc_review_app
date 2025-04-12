// lib/minigames/snake/snake_game_widget.dart

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

enum Direction { up, down, left, right }

class SnakeGameWidget extends StatefulWidget {
  const SnakeGameWidget({super.key});

  @override
  State<SnakeGameWidget> createState() => _SnakeGameWidgetState();
}

class _SnakeGameWidgetState extends State<SnakeGameWidget> {
  static const int rows = 20;
  static const int columns = 20;
  static const Duration tickRate = Duration(milliseconds: 200);

  List<Point<int>> snake = [const Point(10, 10)];
  Point<int> food = const Point(5, 5);
  Direction direction = Direction.right;
  Timer? timer;
  bool gameOver = false;
  int score = 0;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    timer?.cancel();
    snake = [const Point(10, 10)];
    direction = Direction.right;
    food = generateNewFood();
    gameOver = false;
    score = 0;

    timer = Timer.periodic(tickRate, (_) => updateGame());
  }

  void updateGame() {
    setState(() {
      final head = snake.first;
      Point<int> newHead;

      switch (direction) {
        case Direction.up:
          newHead = Point(head.x, head.y - 1);
          break;
        case Direction.down:
          newHead = Point(head.x, head.y + 1);
          break;
        case Direction.left:
          newHead = Point(head.x - 1, head.y);
          break;
        case Direction.right:
          newHead = Point(head.x + 1, head.y);
          break;
      }

      if (newHead.x < 0 ||
          newHead.y < 0 ||
          newHead.x >= columns ||
          newHead.y >= rows ||
          snake.contains(newHead)) {
        gameOver = true;
        timer?.cancel();

        Future.delayed(Duration.zero, showGameOverDialog);
        return;
      }

      snake.insert(0, newHead);
      if (newHead == food) {
        food = generateNewFood();
        score += 10;
      } else {
        snake.removeLast();
      }
    });
  }

  Point<int> generateNewFood() {
    final rng = Random();
    Point<int> newFood;
    do {
      newFood = Point(rng.nextInt(columns), rng.nextInt(rows));
    } while (snake.contains(newFood));
    return newFood;
  }

  void onPanUpdate(DragUpdateDetails details) {
    final dx = details.delta.dx;
    final dy = details.delta.dy;

    if (dx.abs() > dy.abs()) {
      if (dx > 0 && direction != Direction.left) {
        direction = Direction.right;
      } else if (dx < 0 && direction != Direction.right) {
        direction = Direction.left;
      }
    } else {
      if (dy > 0 && direction != Direction.up) {
        direction = Direction.down;
      } else if (dy < 0 && direction != Direction.down) {
        direction = Direction.up;
      }
    }
  }

  void showGameOverDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Não permite fechar clicando fora
      builder: (context) {
        return AlertDialog(
          title: const Text('Game Over'),
          content: Text('Sua pontuação: $score'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // fecha o dialog
                startGame(); // reinicia o jogo
              },
              child: const Text('Reiniciar'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: onPanUpdate,
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: rows * columns,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
              ),
              itemBuilder: (context, index) {
                final x = index % columns;
                final y = index ~/ columns;
                final point = Point(x, y);
                Color color;

                if (snake.first == point) {
                  color = Colors.green.shade700;
                } else if (snake.contains(point)) {
                  color = Colors.green;
                } else if (point == food) {
                  color = Colors.red;
                } else {
                  color = Colors.grey.shade200;
                }

                return Container(
                  margin: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Pontuação: $score',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
