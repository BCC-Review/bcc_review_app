import 'package:bcc_review_app/domain/entities/module.dart';
import 'package:flutter/material.dart';

class ModuleListItem extends StatelessWidget {
  final Module module;
  final VoidCallback? onTap;

  ModuleListItem({super.key, required this.module, this.onTap}) {
    _calcProgress();
  }

  Color _getDifficultyColor() {
    switch (module.difficultyLevel) {
      case DifficultyLevel.easy:
        return Colors.green;
      case DifficultyLevel.medium:
        return Colors.orange;
      case DifficultyLevel.hard:
        return Colors.red;
    }
  }

  double progress = 0;
  int questionsLenght = 0;
  int respondedLenght = 0;
  bool isComplete = false;

  double _calcProgress() {
    final questions = module.multipleChoiceQuestions.toList();
    final responded = questions.where((question) {
      return question.isResponded;
    });
    questionsLenght = questions.length;
    respondedLenght = responded.length;
    progress = ((100 * responded.length) / questions.length) / 100;
    isComplete = questionsLenght > 0 && respondedLenght == questionsLenght;
    return progress;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            spacing: 8,
            children: [
              // Ícone do módulo
              IconModule(
                icon: module.icon,
                size: 18,
                progress: progress,
                isComplete: isComplete,
              ),
              const SizedBox(width: 12),
              // Conteúdo principal
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            module.name,
                            style: Theme.of(context).textTheme.titleSmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    Text(
                      module.description,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Indicador de quandidade de questoes / respondidas
                    Text("$respondedLenght / $questionsLenght"),

                    // Indicador de dificuldade
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //     horizontal: 8,
                    //     vertical: 2,
                    //   ),
                    //   decoration: BoxDecoration(
                    //     color: _getDifficultyColor().withAlpha(60),
                    //     borderRadius: BorderRadius.circular(16),
                    //   ),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       Icon(
                    //         Icons.trending_up,
                    //         size: 10,
                    //         color: _getDifficultyColor(),
                    //       ),
                    //       const SizedBox(width: 4),
                    //       Text(
                    //         module.difficultyLevel.label,
                    //         style: TextStyle(
                    //           fontSize: 10,
                    //           fontWeight: FontWeight.w500,
                    //           color: _getDifficultyColor(),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconModule extends StatelessWidget {
  const IconModule({
    super.key,
    required this.icon,
    this.size = 24,
    required this.progress,
    this.isComplete = false,
  });

  final String icon;
  final double size;
  final double progress;
  final bool isComplete;

  IconData _getIconFromString(String iconName) {
    switch (iconName) {
      case 'functions':
        return Icons.functions;
      case 'data_object':
        return Icons.data_object;
      case 'view_list':
        return Icons.view_list;
      case 'link':
        return Icons.link;
      case 'code': // Adicionando caso para 'code' (usado em Subject, mas pode ser útil)
        return Icons.code;
      case 'data_usage': // Adicionando caso para 'data_usage' (usado em Subject)
        return Icons.data_usage;
      // Adicione mais casos conforme necessário
      default:
        return Icons.extension; // Ícone padrão de fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          backgroundColor:
              isComplete
                  ? Colors.transparent
                  : Theme.of(context).colorScheme.surface,
          radius: size,
          child:
              isComplete
                  ? ClipOval(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomPaint(
                          size: Size(size * 2, size * 2),
                          painter: StripedCirclePainter(
                            primaryColor: const Color(0xFFFFD700),
                            secondaryColor: const Color.fromARGB(
                              255,
                              235,
                              181,
                              46,
                            ),
                          ),
                        ),
                        Icon(
                          _getIconFromString(icon),
                          size: size * 1.2,
                          color: const Color.fromARGB(255, 104, 74, 0),
                        ),
                      ],
                    ),
                  )
                  : Icon(
                    _getIconFromString(icon),
                    size: size * 1.2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
        ),
        SizedBox(
          height: size * 3.1,
          width: size * 3.1,
          child: CircularProgressIndicator(
            value: progress,
            strokeWidth: 4,
            color: isComplete ? Color(0xFFFFD700) : Colors.blue,
            backgroundColor:
                isComplete
                    ? Color(0xFFFFF8DC)
                    : Theme.of(context).colorScheme.surface,
            valueColor: AlwaysStoppedAnimation<Color>(
              isComplete ? Color(0xFFFFD700) : Colors.blue,
            ),
            year2023: false,
          ),
        ),
      ],
    );
  }
}

class StripedCirclePainter extends CustomPainter {
  final Color primaryColor;
  final Color secondaryColor;

  StripedCirclePainter({
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    final center = Offset(radius, radius);

    // Draw the base circle
    final paint =
        Paint()
          ..color = primaryColor
          ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, paint);

    // Draw diagonal stripes
    final stripePaint =
        Paint()
          ..color = secondaryColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = radius / 4;

    for (double i = -size.width * 1.5; i < size.width * 1.5; i += radius / 2) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + size.width, size.height),
        stripePaint,
      );
    }

    // Clip to circle shape
    final clipPath =
        Path()..addOval(Rect.fromCircle(center: center, radius: radius));

    canvas.clipPath(clipPath);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
