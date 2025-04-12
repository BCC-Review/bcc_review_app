import 'package:flutter/material.dart';

class LifeIndicator extends StatefulWidget {
  final int lives;

  const LifeIndicator({super.key, required this.lives});

  @override
  State<LifeIndicator> createState() => _LifeIndicatorState();
}

class _LifeIndicatorState extends State<LifeIndicator>
    with SingleTickerProviderStateMixin {
  late int _oldLives;

  @override
  void initState() {
    super.initState();
    _oldLives = widget.lives;
  }

  @override
  void didUpdateWidget(covariant LifeIndicator oldWidget) {
    if (widget.lives != oldWidget.lives) {
      setState(() {
        _oldLives = oldWidget.lives;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        final isLosingLife = index >= widget.lives && index < _oldLives;
        final wasDead = index >= _oldLives;

        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(
              begin: isLosingLife || wasDead ? 1.0 : 0.0,
              end: index < widget.lives ? 1.0 : 0.0,
            ),
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeIn,
            builder: (context, value, _) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.3),
                    size: 28,
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return SweepGradient(
                        startAngle: 0,
                        endAngle: 3.14 * 2,
                        stops: [value, value],
                        center: Alignment.center,
                        colors: [
                          Theme.of(context).colorScheme.error,
                          Colors.transparent,
                        ],
                      ).createShader(bounds);
                    },
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      }),
    );
  }
}
