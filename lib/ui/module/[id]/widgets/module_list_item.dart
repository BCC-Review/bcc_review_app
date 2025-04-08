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

  double _calcProgress() {
    final questions = module.multipleChoiceQuestions.toList();
    final responded = questions.where((question) {
      return question.isResponded;
    });
    questionsLenght = questions.length;
    respondedLenght = responded.length;
    progress = ((100 * responded.length) / questions.length) / 100;
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
              IconModule(icon: module.icon, size: 18, progress: progress),
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
  });

  final String icon;
  final double size;
  final double progress;

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
          backgroundColor: Theme.of(context).colorScheme.surface,
          radius: size,
          child: Icon(
            _getIconFromString(icon),
            size: size,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(
          height: size * 3.1,
          width: size * 3.1,
          child: CircularProgressIndicator(
            value: progress,
            strokeWidth: 4,
            color: Colors.blue,
            backgroundColor: Theme.of(context).colorScheme.surface,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            year2023: false,
          ),
        ),
      ],
    );
  }
}
