import 'package:flutter/material.dart';

class LifeIndicator extends StatelessWidget {
  final int lives;

  const LifeIndicator({super.key, required this.lives});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            index < lives ? Icons.favorite : Icons.favorite_border,
            color:
                index < lives
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            size: 24,
          ),
        );
      }),
    );
  }
}
