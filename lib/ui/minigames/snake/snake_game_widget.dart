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
  Point<int>? blueFood;
  Point<int>? redFood;
  Direction direction = Direction.right;
  Timer? timer;
  bool gameOver = false;
  int score = 0;

  late String logicExpression;
  late int logicResult;

  final Random _rng = Random();

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    timer?.cancel();
    snake = [const Point(10, 10)];
    direction = Direction.right;
    gameOver = false;
    score = 0;

    generateNewExpression();
    spawnFood();

    // Inicia o jogo apenas depois de o pop-up ser fechado
    Future.delayed(Duration.zero, () async {
      await showInstructionsDialog();
      timer = Timer.periodic(tickRate, (_) => updateGame());
    });
  }

  void generateNewExpression() {
    final a = _rng.nextBool() ? 1 : 0;
    final b = _rng.nextBool() ? 1 : 0;
    final operators = ['AND', 'OR', 'XOR', 'NOR'];
    final op = operators[_rng.nextInt(operators.length)];

    logicExpression = '$a $op $b';
    logicResult = evaluateLogicExpression(a, b, op);
  }

  int evaluateLogicExpression(int a, int b, String op) {
    switch (op) {
      case 'AND':
        return a & b;
      case 'OR':
        return a | b;
      case 'XOR':
        return a ^ b;
      case 'NOR':
        return ~(a | b) & 1;
      default:
        return 0;
    }
  }

  void spawnFood() {
    Point<int> newBlue;
    Point<int> newRed;
    do {
      newBlue = Point(_rng.nextInt(columns), _rng.nextInt(rows));
    } while (snake.contains(newBlue));

    do {
      newRed = Point(_rng.nextInt(columns), _rng.nextInt(rows));
    } while (snake.contains(newRed) || newRed == newBlue);

    blueFood = newBlue;
    redFood = newRed;
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

      final targetFood = logicResult == 1 ? blueFood : redFood;

      if (newHead == targetFood) {
        score += 10;
        generateNewExpression();
        spawnFood();
      } else {
        // Se pegar o alimento errado, o jogo termina
        if ((newHead == blueFood && logicResult == 0) ||
            (newHead == redFood && logicResult == 1)) {
          gameOver = true;
          timer?.cancel();
          Future.delayed(Duration.zero, showGameOverDialog);
          return;
        }
        snake.removeLast();
      }
    });
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

  Future<void> showInstructionsDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: false, // Não permite fechar clicando fora
      builder: (context) {
        return AlertDialog(
          title: const Text('Como Jogar'),
          content: const Text(
            'Neste jogo, a cobra deve comer o alimento correto baseado em uma expressão lógica.\n\n'
                'A cada comida, uma nova expressão é gerada. Se o resultado for 1, a cobra deve pegar os alimentos azuis.\n'
                'Se o resultado for 0, a cobra deve pegar os alimentos vermelhos.\n\n'
                'Evite pegar o alimento errado, caso contrário, o jogo acabará! Toque na tela para controlar a direção da cobra.',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha a tela de instruções
              },
              child: const Text('Entendido'),
            ),
          ],
        );
      },
    );
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
                Navigator.of(context).pop(); // Fecha o dialog
                startGame(); // Reinicia o jogo
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
                } else if (point == blueFood) {
                  color = Colors.blue;
                } else if (point == redFood) {
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
          Text(
            'Expressão lógica: $logicExpression',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
