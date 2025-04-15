import 'package:flutter/material.dart';

class QuizAlternative extends StatelessWidget {
  final int index;
  final String text;
  final bool isSelected;
  final bool showResult;
  final bool isCorrect;
  final VoidCallback onTap;

  const QuizAlternative({
    super.key,
    required this.index,
    required this.text,
    required this.isSelected,
    required this.showResult,
    required this.isCorrect,
    required this.onTap,
  });

  @override
  @override
  Widget build(BuildContext context) {
    final letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
    final letter =
        index < letters.length ? letters[index] : (index + 1).toString();

    Color backgroundColor;
    Color textColor = Theme.of(context).colorScheme.onSurface;
    IconData? trailingIcon;
    Color iconColor = Theme.of(context).colorScheme.onSurface;

    if (showResult) {
      if (isCorrect) {
        backgroundColor = Colors.green.shade100;
        textColor = Colors.green.shade900;
        trailingIcon = Icons.check_circle;
        iconColor = Colors.green;
      } else if (isSelected) {
        backgroundColor = Colors.red.shade100;
        textColor = Colors.red.shade900;
        trailingIcon = Icons.cancel;
        iconColor = Colors.red;
      } else {
        backgroundColor = Theme.of(context).colorScheme.surface.withAlpha(30);
        textColor = Theme.of(context).colorScheme.onSurface;
      }
    } else {
      backgroundColor = Theme.of(context).cardTheme.color ?? Colors.white;
    }

    return Card(
      margin: const EdgeInsets.all(0),
      color: backgroundColor,
      shadowColor: Colors.transparent,
      child: InkWell(
        onTap: showResult ? null : onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Row(
              children: [
                SizedBox(width: 25),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      text,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Visibility(
                  visible: trailingIcon != null,
                  replacement: SizedBox(width: 28),
                  child: Icon(trailingIcon, color: iconColor, size: 28),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
