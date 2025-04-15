import 'package:asuka/asuka.dart';
import 'package:bcc_review_app/config/dependecies.dart';
import 'package:bcc_review_app/core/exceptions/app_exception.dart';
import 'package:bcc_review_app/domain/entities/question.dart';
import 'package:bcc_review_app/ui/module/create_questions/%5BmoduleId%5D/form_questions_view_model.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:routefly/routefly.dart';

class CreateQuestionsPage extends StatefulWidget {
  const CreateQuestionsPage({super.key});

  @override
  State<CreateQuestionsPage> createState() => _CreateQuestionsPageState();
}

class _CreateQuestionsPageState extends State<CreateQuestionsPage> {
  // Extrai o moduleId da rota. Assume 0 se não encontrado (tratar erro seria melhor)
  late final int moduleId;
  late final FormQuestionsViewModel viewModel;

  @override
  void initState() {
    super.initState();

    // Tenta converter o parâmetro da rota para int
    final queryModuleId = Routefly.query['moduleId'];
    moduleId = int.tryParse(queryModuleId?.toString() ?? '') ?? 0;

    // Obtém a instância do ViewModel via injector
    viewModel = injector.get<FormQuestionsViewModel>();
    // Adiciona um listener para reagir aos resultados do comando de salvar
    viewModel.saveQuestionsCommand.addListener(_listenable);
    // Carrega o módulo e suas questões
    viewModel.getModule(moduleId);
  }

  @override
  void dispose() {
    // Remove o listener ao descartar a página
    viewModel.saveQuestionsCommand.removeListener(_listenable);
    // Limpa a lista de questões no viewmodel ao sair da página? Opcional.
    // viewModel.clearQuestions(); // Se implementar esse método
    super.dispose();
  }

  // Listener para feedback do comando de salvar
  void _listenable() {
    final command = viewModel.saveQuestionsCommand;
    if (command.isSuccess) {
      AsukaSnackbar.success('Questões salvas com sucesso!').show();
      Routefly.pop(context); // Volta para a tela anterior
    } else if (command.isFailure) {
      final failure = command.value as FailureCommand;
      final exception = failure.error;
      String errorMessage = 'Ocorreu um erro desconhecido ao salvar.';

      // Verifica se é um erro de validação (lançado pelo ViewModel)
      // ou outro tipo de erro.
      if (exception is AppException &&
          exception.message == 'Por favor, corrija os erros indicados.') {
        Asuka.showDialog(
          builder: (context) {
            return AlertDialog(
              title: const Text('Erro de Validação'),
              content: const Text('Por favor, corrija os erros indicados.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        // Apenas força o rebuild para garantir que a UI reflita o estado de loading/erro.
      } else {
        // Mostra Snackbar para outros erros (ex: falha no repositório)
        if (exception is AppException) {
          errorMessage = exception.message;
        } else
          errorMessage = exception.toString();

        AsukaSnackbar.alert(errorMessage).show();
      }
    }
    // Força a reconstrução para atualizar o estado do botão (loading)
    // e garantir que os erros inline sejam exibidos/limpos corretamente.
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Criar Questões',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Título da Página
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Módulo: ',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        viewModel.module?.name ?? 'Carregando...',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                // Lista de formulários de questão
                ListView.builder(
                  shrinkWrap:
                      true, // Para funcionar dentro de SingleChildScrollView
                  physics:
                      const NeverScrollableScrollPhysics(), // Desabilita scroll interno
                  itemCount: viewModel.questions.length,
                  itemBuilder: (context, index) {
                    return _QuestionFormCard(
                      key: ValueKey(
                        viewModel.questions[index].hashCode,
                      ), // Chave para stateful widget
                      questionIndex: index,
                      viewModel: viewModel,
                    );
                  },
                ),
                const SizedBox(height: 16),
                // Botão para adicionar nova questão
                FilledButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Adicionar Nova Questão'),
                  onPressed: viewModel.addEmptyQuestion,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.secondary,
                    ),
                    foregroundColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),

                // Botão para salvar todas as questões
                ElevatedButton(
                  onPressed:
                      viewModel.saveQuestionsCommand.isRunning
                          ? null // Desabilita enquanto salva
                          : () {
                            // Atualiza o estado dos controllers antes de salvar, se necessário
                            // (depende da implementação do _QuestionFormCard)
                            viewModel.saveQuestionsCommand.execute(moduleId);
                            // Força rebuild para mostrar loading no botão
                            setState(() {});
                          },
                  child:
                      viewModel.saveQuestionsCommand.isRunning
                          ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                          : const Text('Salvar Todas as Questões'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// --- Widget para o formulário de cada questão ---

class _QuestionFormCard extends StatefulWidget {
  final int questionIndex;
  final FormQuestionsViewModel viewModel;

  const _QuestionFormCard({
    required this.questionIndex,
    required this.viewModel,
    super.key,
  });

  @override
  State<_QuestionFormCard> createState() => _QuestionFormCardState();
}

class _QuestionFormCardState extends State<_QuestionFormCard> {
  late final FormQuestionsViewModel viewModel;
  late TextEditingController _statementController;
  late List<TextEditingController> _alternativeControllers;
  bool _isExpanded = true; // Estado para controlar a expansão

  @override
  void initState() {
    super.initState();
    viewModel = widget.viewModel;
    final question = viewModel.questions[widget.questionIndex];

    // Inicializa controllers com os dados do ViewModel
    _statementController = TextEditingController(text: question.statement);
    _alternativeControllers =
        question.alternatives
            .map((alt) => TextEditingController(text: alt))
            .toList();

    // Adiciona listeners para atualizar o ViewModel quando o texto mudar
    // (Pode ser otimizado para atualizar onEditingComplete ou onFocusLost)
    _statementController.addListener(() {
      viewModel.updateQuestionStatement(
        widget.questionIndex,
        _statementController.text,
      );
    });
    for (int i = 0; i < _alternativeControllers.length; i++) {
      _alternativeControllers[i].addListener(() {
        viewModel.updateAlternative(
          widget.questionIndex,
          i,
          _alternativeControllers[i].text,
        );
      });
    }
  }

  @override
  void didUpdateWidget(covariant _QuestionFormCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Se o widget for reconstruído com um índice diferente (improvável com ValueKey),
    // ou se a lista de alternativas mudar externamente, reajusta os controllers.
    final question = viewModel.questions[widget.questionIndex];
    if (widget.questionIndex != oldWidget.questionIndex ||
        _alternativeControllers.length != question.alternatives.length) {
      _statementController.text = question.statement;
      for (var controller in _alternativeControllers) {
        controller.dispose();
      }
      _alternativeControllers =
          question.alternatives
              .map((alt) => TextEditingController(text: alt))
              .toList();
      // Re-adiciona listeners
      for (int i = 0; i < _alternativeControllers.length; i++) {
        _alternativeControllers[i].addListener(() {
          viewModel.updateAlternative(
            widget.questionIndex,
            i,
            _alternativeControllers[i].text,
          );
        });
      }
    }
  }

  @override
  void dispose() {
    // Descarta todos os controllers
    _statementController.dispose();
    for (var controller in _alternativeControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Usa um Consumer para obter a questão mais recente e reconstruir se necessário
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        // Garante que o índice ainda é válido (caso uma questão anterior seja removida)
        if (widget.questionIndex >= viewModel.questions.length) {
          return const SizedBox.shrink(); // Não renderiza nada se inválido
        }
        final question = viewModel.questions[widget.questionIndex];
        final questionNumber = widget.questionIndex + 1;
        // Obtém os erros específicos para esta questão, se houver
        final errors = viewModel.validationErrors[widget.questionIndex] ?? {};

        // Sincroniza controllers se o número de alternativas mudou (adicionar/remover)
        if (_alternativeControllers.length != question.alternatives.length) {
          for (var controller in _alternativeControllers) {
            controller.dispose();
          }
          _alternativeControllers =
              question.alternatives
                  .map((alt) => TextEditingController(text: alt))
                  .toList();
          // Re-adiciona listeners
          for (int i = 0; i < _alternativeControllers.length; i++) {
            _alternativeControllers[i].addListener(() {
              viewModel.updateAlternative(
                widget.questionIndex,
                i,
                _alternativeControllers[i].text,
              );
            });
          }
          // Agenda uma reconstrução para usar os novos controllers
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) setState(() {});
          });
        }

        // Define a borda do card com base na existência de erros
        final cardTheme = Theme.of(context).cardTheme;
        final defaultShape = cardTheme.shape as RoundedRectangleBorder?;
        final errorShape = RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1.5,
          ),
          borderRadius:
              defaultShape?.borderRadius ??
              BorderRadius.circular(12), // Usa o raio do tema ou um padrão
        );

        return Card(
          margin: const EdgeInsets.only(bottom: 16.0),
          elevation: 2,
          shape:
              errors.isNotEmpty
                  ? errorShape
                  : defaultShape, // Aplica a borda condicionalmente
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cabeçalho do Card (Número da Questão e Botão Remover)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Questão $questionNumber',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Row(
                      // Agrupa botões de ação
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Botão Expandir/Minimizar
                        IconButton(
                          icon: Icon(
                            _isExpanded ? Icons.expand_less : Icons.expand_more,
                          ),
                          tooltip: _isExpanded ? 'Minimizar' : 'Expandir',
                          onPressed: () {
                            setState(() {
                              _isExpanded = !_isExpanded;
                            });
                          },
                        ),
                        // Só mostra o botão de remover se houver mais de uma questão
                        if (viewModel.questions.length > 1)
                          IconButton(
                            icon: Icon(
                              Icons.delete_outline,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            tooltip: 'Remover Questão $questionNumber',
                            onPressed:
                                () => viewModel.removeQuestion(
                                  widget.questionIndex,
                                ),
                          ),
                      ],
                    ),
                  ],
                ),
                // Prévia do enunciado quando minimizado
                Visibility(
                  visible: !_isExpanded,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _statementController.text.isEmpty
                          ? '(Enunciado vazio)'
                          : _statementController.text,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                // Conteúdo Expansível
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Visibility(
                    visible: _isExpanded,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        // Campo Enunciado
                        TextFormField(
                          controller: _statementController,
                          decoration: InputDecoration(
                            labelText: 'Enunciado da Questão',
                            border: const OutlineInputBorder(),
                            alignLabelWithHint: true,
                            errorText:
                                errors['statement'], // Exibe erro do enunciado
                          ),
                          maxLines: null, // Permite múltiplas linhas
                          textInputAction: TextInputAction.newline,
                        ),
                        const SizedBox(height: 16),

                        // Título Alternativas
                        Text(
                          'Alternativas (Marque a correta):',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),

                        // Lista de Alternativas
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: question.alternatives.length,
                          itemBuilder: (context, altIndex) {
                            // Garante que temos um controller para esta alternativa
                            if (altIndex >= _alternativeControllers.length) {
                              return const SizedBox.shrink(); // Evita erro de range
                            }
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Radio Button para selecionar a correta
                                  Radio<int>(
                                    value: altIndex,
                                    groupValue: question.correctAnswerIndex,
                                    onChanged: (value) {
                                      if (value != null) {
                                        viewModel.updateCorrectAnswerIndex(
                                          widget.questionIndex,
                                          value,
                                        );
                                      }
                                    },
                                  ),
                                  // Campo de Texto da Alternativa
                                  Expanded(
                                    child: TextFormField(
                                      controller:
                                          _alternativeControllers[altIndex],
                                      decoration: InputDecoration(
                                        labelText:
                                            'Alternativa ${altIndex + 1}',
                                        border: const OutlineInputBorder(),
                                        isDense: true,
                                        errorText:
                                            errors['alternative_$altIndex'], // Exibe erro da alternativa
                                      ),
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ),
                                  // Botão Remover Alternativa (se houver mais de 2)
                                  if (question.alternatives.length > 2)
                                    IconButton(
                                      icon: const Icon(
                                        Icons.remove_circle_outline,
                                        size: 20,
                                      ),
                                      tooltip:
                                          'Remover Alternativa ${altIndex + 1}',
                                      onPressed:
                                          () => viewModel.removeAlternative(
                                            widget.questionIndex,
                                            altIndex,
                                          ),
                                      padding: const EdgeInsets.only(left: 8),
                                      constraints: const BoxConstraints(),
                                    )
                                  else
                                    const SizedBox(
                                      width: 48,
                                    ), // Espaço placeholder
                                ],
                              ),
                            );
                          },
                        ),
                        // Exibe erro geral das alternativas ou da resposta correta
                        if (errors.containsKey('alternatives') ||
                            errors.containsKey('correctAnswerIndex'))
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              left: 16.0,
                            ), // Adiciona padding
                            child: Text(
                              errors['alternatives'] ??
                                  errors['correctAnswerIndex'] ??
                                  '',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        const SizedBox(height: 8),

                        // Botão Adicionar Alternativa
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton.icon(
                            icon: const Icon(Icons.add, size: 18),
                            label: const Text('Adicionar Alternativa'),
                            onPressed:
                                () => viewModel.addAlternative(
                                  widget.questionIndex,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
