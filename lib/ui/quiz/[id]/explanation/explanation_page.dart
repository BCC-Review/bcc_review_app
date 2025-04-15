import 'package:bcc_review_app/config/dependecies.dart';
import 'package:bcc_review_app/ui/quiz/%5Bid%5D/explanation/explanation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:routefly/routefly.dart';

class ExplanationPage extends StatefulWidget {
  const ExplanationPage({super.key});

  @override
  State<ExplanationPage> createState() => _ExplanationPageState();
}

class _ExplanationPageState extends State<ExplanationPage> {
  final ExplanationViewModel viewModel = injector.get<ExplanationViewModel>();
  final int _questionId = Routefly.query['id'];
  final int _selectedIndex =
      (Routefly.query.arguments as Map<String, dynamic>)['selectedIndex'];

  @override
  void initState() {
    viewModel.init(_questionId, _selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explicação da Questão',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        elevation: 2,
        toolbarHeight: 70,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Card(
            child: Container(
              decoration: BoxDecoration(
                color: colorScheme.inversePrimary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: colorScheme.inversePrimary.withOpacity(0.3),
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListenableBuilder(
                    listenable: viewModel,
                    builder: (context, _) {
                      return Row(
                        children: [
                          Icon(
                            Icons.auto_awesome,
                            color: colorScheme.primary,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Motor de IA',
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.primary,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.primary,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: viewModel.selectedModel,
                                  isDense: true,
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: colorScheme.onSecondaryContainer,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  style: TextStyle(
                                    color: colorScheme.onSecondaryContainer,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      viewModel.changeModel(newValue);
                                    }
                                  },
                                  items:
                                      viewModel.availableModels
                                          .map<DropdownMenuItem<String>>((
                                            String value,
                                          ) {
                                            String displayName = value
                                                .replaceAll('gemini-', '')
                                                .replaceAll('-preview', '');

                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(displayName),
                                            );
                                          })
                                          .toList(),
                                  dropdownColor: colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  if (viewModel.isLoading && viewModel.explanation != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: colorScheme.secondary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Atualizando explicação...',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: colorScheme.secondary),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          // Verifica se a inicialização falhou por falta de parâmetros
          if (_selectedIndex == null &&
              viewModel.error == null &&
              !viewModel.isLoading) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: colorScheme.error,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Erro ao carregar a página',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: colorScheme.error,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Parâmetros inválidos ou questão não encontrada.',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () => Routefly.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Voltar'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (viewModel.isLoading) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(color: colorScheme.primary),
                  const SizedBox(height: 16),
                  Text(
                    'Gerando explicação...',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Isso pode levar alguns segundos',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            );
          }

          if (viewModel.error != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      size: 64,
                      color: colorScheme.error,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Opa! Tivemos um problema',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      viewModel.error!,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () => Routefly.pop(context),
                          icon: const Icon(Icons.arrow_back),
                          label: const Text('Voltar'),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton.icon(
                          onPressed:
                              () => viewModel.init(_questionId, _selectedIndex),
                          icon: const Icon(Icons.refresh),
                          label: const Text('Tentar novamente'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }

          if (viewModel.question == null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.search_off_rounded,
                      size: 64,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Questão não encontrada',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Não foi possível carregar os dados da questão.',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () => Routefly.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Voltar para exercícios'),
                    ),
                  ],
                ),
              ),
            );
          }

          // --- UI Principal ---
          final question = viewModel.question!;
          final explanation =
              viewModel.explanation ?? "Aguardando explicação...";

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Enunciado
                Card(
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest.withOpacity(
                        0.5,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.quiz_rounded,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Enunciado',
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        GptMarkdown(question.statement),
                      ],
                    ),
                  ),
                ),
                // Alternativas
                Card(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.checklist_rounded,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Alternativas',
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: question.alternatives.length,
                          itemBuilder: (context, index) {
                            final isCorrect =
                                index == question.correctAnswerIndex;
                            final isSelected = index == _selectedIndex;

                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color:
                                      isCorrect
                                          ? Colors.green
                                          : (isSelected && !isCorrect)
                                          ? colorScheme.error
                                          : Colors.transparent,
                                  width: 1.5,
                                ),
                              ),
                              color:
                                  isCorrect
                                      ? Colors.green.withOpacity(0.2)
                                      : (isSelected && !isCorrect)
                                      ? colorScheme.error.withOpacity(0.2)
                                      : colorScheme.surface,
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                leading: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        isCorrect
                                            ? Colors.green.shade100
                                            : (isSelected && !isCorrect)
                                            ? Colors.red.shade100
                                            : colorScheme
                                                .surfaceContainerHighest,
                                  ),
                                  child: Center(
                                    child:
                                        isCorrect
                                            ? Icon(
                                              Icons.check_rounded,
                                              color: Colors.green.shade700,
                                              size: 18,
                                            )
                                            : (isSelected && !isCorrect)
                                            ? Icon(
                                              Icons.close_rounded,
                                              color: Colors.red.shade700,
                                              size: 18,
                                            )
                                            : Text(
                                              String.fromCharCode(65 + index),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    colorScheme
                                                        .onSurfaceVariant,
                                              ),
                                            ),
                                  ),
                                ),
                                title: Text(
                                  question.alternatives[index],
                                  style: TextStyle(
                                    fontWeight:
                                        (isSelected || isCorrect)
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // Explicação da IA
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        colorScheme.primaryContainer.withOpacity(0.1),
                        colorScheme.surfaceContainerHighest.withOpacity(0.04),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withOpacity(0.1),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.lightbulb,
                              color: colorScheme.primary,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Explicação Detalhada',
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GptMarkdown(explanation),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Botões de ação
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 24,
                    left: 16,
                    right: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => Routefly.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.primaryContainer,
                            foregroundColor: colorScheme.onPrimaryContainer,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          icon: const Icon(Icons.check_circle_outline),
                          label: const Text(
                            'Entendi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
