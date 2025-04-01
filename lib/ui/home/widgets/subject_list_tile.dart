import 'package:bcc_review_app/domain/entities/subject.dart';
import 'package:flutter/material.dart';

class SubjectListTile extends StatelessWidget {
  final Subject subject;
  final VoidCallback? onTap;
  final double progressValue;

  const SubjectListTile({
    super.key,
    required this.subject,
    this.onTap,
    this.progressValue = 0.34,
  });

  double _calcProgress() {
    final allModules = subject.modules.toList();
    List allQuestions =
        allModules.expand((module) => module.multipleChoiceQuestions).toList();
    final responded = allQuestions.where((question) {
      return question.isResponded;
    });
    return allQuestions.isNotEmpty
        ? ((100 * responded.length) / allQuestions.length) / 100
        : 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap ?? () {},
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              // Avatar do assunto com ícone
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.book,
                  size: 28,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(width: 16),
              // Informações do assunto
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            subject.name,
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subject.description,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    // Barra de progresso com indicador visual
                    Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              // Fundo da barra de progresso
                              Container(
                                height: 8,
                                decoration: BoxDecoration(
                                  color: colorScheme.surfaceContainerHighest,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              // Barra de progresso
                              FractionallySizedBox(
                                widthFactor: _calcProgress(),
                                child: Container(
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: _getProgressColor(
                                      colorScheme,
                                      _calcProgress(),
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${(_calcProgress() * 100).toInt()}%',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Função para retornar uma cor baseada no progresso
  Color _getProgressColor(ColorScheme colorScheme, double progress) {
    if (progress < 1) return colorScheme.primary;
    return Colors.amber;
  }
}
