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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explicação da Questão'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Routefly.pop(context),
        ),
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          // Verifica se a inicialização falhou por falta de parâmetros
          if (_selectedIndex == null &&
              viewModel.error == null &&
              !viewModel.isLoading) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Erro ao carregar a página: Parâmetros inválidos.',
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.error != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Erro: ${viewModel.error}',
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          if (viewModel.question == null) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Não foi possível carregar os dados da questão.',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          // --- UI Principal ---
          final question = viewModel.question!;
          final explanation =
              viewModel.explanation ?? "Aguardando explicação...";

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Enunciado
                Text(
                  'Questão:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                GptMarkdown(question.statement),
                const SizedBox(height: 24),

                // Alternativas
                Text(
                  'Alternativas:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: question.alternatives.length,
                  itemBuilder: (context, index) {
                    final isCorrect = index == question.correctAnswerIndex;
                    final isSelected =
                        index == _selectedIndex; // Usar a variável local
                    IconData? icon;
                    Color? color;
                    FontWeight? fontWeight;

                    if (isSelected && !isCorrect) {
                      icon = Icons.close;
                      color = Colors.red.shade100;
                      fontWeight = FontWeight.bold;
                    } else if (isCorrect) {
                      icon = Icons.check;
                      color = Colors.green.shade100;
                      fontWeight = FontWeight.bold;
                    }

                    return Card(
                      color: color,
                      elevation: isSelected || isCorrect ? 2 : 1,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        leading:
                            icon != null
                                ? Icon(icon, color: Colors.black87)
                                : SizedBox(
                                  width: 24,
                                ), // Placeholder para alinhar
                        title: Text(
                          question.alternatives[index],
                          style: TextStyle(fontWeight: fontWeight),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),

                // Seletor de Modelo
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Modelo da IA:',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    DropdownButton<String>(
                      value: viewModel.selectedModel,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          viewModel.changeModel(newValue);
                        }
                      },
                      items:
                          viewModel.availableModels
                              .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              })
                              .toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Explicação da IA
                Text(
                  'Explicação:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Card(
                  elevation: 0,
                  color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GptMarkdown(explanation),
                  ),
                ),
                const SizedBox(height: 32),

                // Botão Voltar
                Center(
                  child: ElevatedButton(
                    onPressed: () => Routefly.pop(context),
                    child: const Text('Entendi'),
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
