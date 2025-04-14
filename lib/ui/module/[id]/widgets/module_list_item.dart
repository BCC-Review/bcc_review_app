import 'package:bcc_review_app/app_widget.dart';
import 'package:bcc_review_app/domain/entities/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:routefly/routefly.dart';

class ModuleListItem extends StatelessWidget {
  final Module module;
  final VoidCallback? onTap;
  final VoidCallback? onTapEdit;

  ModuleListItem({
    super.key,
    required this.module,
    this.onTap,
    this.onTapEdit,
  }) {
    _calcProgress();
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
    if (questionsLenght == 0) return 0;
    progress = ((100 * responded.length) / questions.length) / 100;
    isComplete = questionsLenght > 0 && respondedLenght == questionsLenght;
    return progress;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (questionsLenght == 0)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 6,
                left: 16,
                right: 16,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.amber[900],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "Adicione questões para começar a revisar!",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.white),
              ),
            ),
          ),
        Card(
          margin: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: questionsLenght == 0 ? 34 : 8,
          ),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                spacing: 8,
                children: [
                  IconModule(
                    icon: module.icon,
                    size: 18,
                    progress: progress,
                    isComplete: isComplete,
                  ),
                  const SizedBox(width: 12),
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
                      ],
                    ),
                  ),
                  if (onTapEdit != null)
                    IconButton(
                      onPressed: onTapEdit,
                      icon: const Icon(Icons.edit),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
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

  IconPickerIcon _getIconFromString(String iconName) {
    return Module.getIcon(iconName) ??
        IconPickerIcon(
          name: iconName,
          data: Icons.question_mark,
          pack: IconPack.roundedMaterial,
        );
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
                          _getIconFromString(icon).data,
                          size: size * 1.2,
                          color: const Color.fromARGB(255, 104, 74, 0),
                        ),
                      ],
                    ),
                  )
                  : Icon(
                    _getIconFromString(icon).data,
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
