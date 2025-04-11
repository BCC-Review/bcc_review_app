import 'package:asuka/asuka.dart';
import 'package:bcc_review_app/config/dependecies.dart';
import 'package:bcc_review_app/core/ui/widgets/custom_elevated_button.dart';
import 'package:bcc_review_app/ui/quiz/%5Bid%5D/quiz_view_model.dart';
import 'package:bcc_review_app/ui/quiz/%5Bid%5D/widgets/life_indicator.dart';
import 'package:bcc_review_app/ui/quiz/%5Bid%5D/widgets/progress_bar.dart';
import 'package:bcc_review_app/ui/quiz/%5Bid%5D/widgets/quiz_alternative.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final moduleId = int.tryParse(Routefly.query['id'].toString()) ?? 0;
  final viewModel = injector.get<QuizViewModel>();
  bool _showFinalResults = false;
  bool canPop = false;
  bool canClose = false;

  @override
  void initState() {
    super.initState();
    viewModel.loadQuiz(moduleId);
  }

  Future<void> _handleAnswerSubmission(int answerIndex) async {
    if (viewModel.selectedAnswerIndex != null) return;

    final isCorrect = viewModel.submitAnswer(answerIndex);

    if (isCorrect) {
      // Adicionar feedback positivo
      Asuka.showModalBottomSheet(
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            color: Colors.green[100],
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.1,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.check_circle, color: Colors.green[900]),
                    Text(
                      'Correto',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.green[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                CustomElevatedButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.green,
                  shadowColor: Colors.green[700],
                  onPressed: () {
                    viewModel.nextQuestion();
                    Routefly.pop(context);
                  },
                  text: 'Continuar',
                ),
              ],
            ),
          );
        },
        isDismissible: false,
      );
    } else {
      // Adicionar feedback negativo
      await Asuka.showModalBottomSheet(
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).colorScheme.error,
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.1,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    const Icon(Icons.error, color: Colors.white),
                    Text(
                      'Incorreto',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Text(
                  'Resposta Correta:',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  viewModel.currentQuestion?.alternatives[viewModel
                              .currentQuestion
                              ?.correctAnswerIndex ??
                          0] ??
                      '',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: Colors.white),
                ),
                CustomElevatedButton(
                  backgroundColor: Colors.black,
                  foregroundColor: Color(0xFF36C8FD),
                  shadowColor: Colors.red[900],
                  text: 'EXPLIQUE MEU ERRO COM IA',
                  onPressed: () {
                    AsukaMaterialBanner.warning('Em breve').show();
                  },
                ),
                CustomElevatedButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).colorScheme.error,
                  shadowColor: Colors.red[900],
                  text: 'Ok',
                  onPressed: () {
                    viewModel.nextQuestion();
                    Routefly.pop(context);
                  },
                ),
              ],
            ),
          );
        },
        isDismissible: false,
        isScrollControlled: false,
        enableDrag: false,
      );
    }

    if (viewModel.isQuizFinished) {
      setState(() {
        _showFinalResults = true;
      });
    }
  }

  void _handleCloseQuiz() async {
    if (canClose) return;
    setState(() {
      canPop = false;
    });
    final result = await Asuka.showModalBottomSheet(
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).colorScheme.surface,
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.1,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Row(
                spacing: 8,
                children: [
                  Icon(Icons.question_mark_rounded),
                  Text(
                    'Sair do Quiz',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Você realmente deseja sair do quiz? Você perderá seu progresso.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
              ),
              const SizedBox(height: 16),
              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          canPop = true;
                          canClose = true;
                        });
                        Routefly.pop(context, result: true);
                      },
                      child: const Text('Sair'),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Routefly.pop(context, result: false);
                      },
                      child: const Text('Cancelar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );

    if (result == true) {
      Routefly.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, result) {
        _handleCloseQuiz();
      },
      child: Scaffold(
        appBar:
            _showFinalResults
                ? null
                : AppBar(
                  automaticallyImplyLeading: false,
                  title: Row(
                    children: [
                      IconButton(
                        onPressed: _handleCloseQuiz,
                        icon: Icon(Icons.close_outlined),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: AnimatedBuilder(
                            animation: viewModel,
                            builder:
                                (context, _) => ProgressBar(
                                  current: viewModel.currentQuestionIndex,
                                  total: viewModel.quizQuestions.length,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AnimatedBuilder(
                          animation: viewModel,
                          builder:
                              (context, _) =>
                                  LifeIndicator(lives: viewModel.lives),
                        ),
                      ),
                    ],
                  ),
                ),
        body: AnimatedBuilder(
          animation: viewModel,
          builder: (context, _) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (viewModel.errorMessage != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(viewModel.errorMessage!),
                    TextButton(
                      onPressed: () => viewModel.loadQuiz(moduleId),
                      child: const Text('Tentar Novamente'),
                    ),
                  ],
                ),
              );
            }

            if (_showFinalResults) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Quiz Finalizado!',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'XP Total: ${viewModel.totalXPEarned}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      viewModel.lives <= 0
                          ? 'Você perdeu todas as vidas!'
                          : 'Você completou todas as questões!',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextButton(
                            onPressed: () {
                              Routefly.navigate('/module/$moduleId');
                            },
                            child: const Text('Voltar aos Módulos'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: FilledButton(
                            onPressed: () {
                              viewModel.loadQuiz(moduleId);
                              setState(() {
                                _showFinalResults = false;
                              });
                            },
                            child: const Text('Tentar Novamente'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }

            final currentQuestion = viewModel.currentQuestion;
            if (currentQuestion == null) {
              return const Center(child: Text('Nenhuma questão disponível.'));
            }

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Card(
                          elevation: 4,
                          margin: const EdgeInsets.only(bottom: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              currentQuestion.statement,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ),
                        ...List.generate(
                          currentQuestion.alternatives.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: QuizAlternative(
                              index: index,
                              text: currentQuestion.alternatives[index],
                              isSelected:
                                  viewModel.selectedAnswerIndex == index,
                              showResult: viewModel.selectedAnswerIndex != null,
                              isCorrect:
                                  viewModel.selectedAnswerIndex != null &&
                                  index == currentQuestion.correctAnswerIndex,
                              onTap: () => _handleAnswerSubmission(index),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
