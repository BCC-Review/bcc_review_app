import 'package:asuka/asuka.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bcc_review_app/config/dependecies.dart';
import 'package:bcc_review_app/core/ui/widgets/custom_elevated_button.dart';
import 'package:bcc_review_app/ui/quiz/%5Bid%5D/quiz_view_model.dart';
import 'package:bcc_review_app/ui/quiz/%5Bid%5D/widgets/life_indicator.dart';
import 'package:bcc_review_app/ui/quiz/%5Bid%5D/widgets/progress_bar.dart';
import 'package:bcc_review_app/ui/quiz/%5Bid%5D/widgets/quiz_alternative.dart';
import 'package:bcc_review_app/ui/quiz/%5Bid%5D/widgets/quiz_defeat_state.dart';
import 'package:bcc_review_app/ui/quiz/%5Bid%5D/widgets/quiz_victory_state.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

final AudioPlayer _audioPlayer = AudioPlayer();

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
    _audioPlayer.setVolume(0.7); // Volume do reprodutor de som
    viewModel.loadQuiz(moduleId);
  }

  Future<void> _handleAnswerSubmission(int answerIndex) async {
    if (viewModel.selectedAnswerIndex != null) return;

    final isCorrect = await viewModel.submitAnswer(answerIndex);

    if (isCorrect) {
      // Reproduzindo som de acerto
      await _audioPlayer.play(AssetSource('audio/correct.mp3'));
      await Future.delayed(Duration(seconds: 1));
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
              spacing: 16,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.check_circle, color: Colors.green[900]),
                    const SizedBox(width: 8),
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
                    Routefly.pop(context);
                    if (viewModel.isQuizFinished) {
                      setState(() {
                        _audioPlayer.play(AssetSource('audio/victory.mp3'));
                        _showFinalResults = true;
                      });
                    } else {
                      _audioPlayer.play(AssetSource('audio/progress.mp3'));
                      viewModel.nextQuestion();
                    }
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
      // Reproduzindo som de erro
      await _audioPlayer.play(AssetSource('audio/wrong.mp3'));
      await Future.delayed(Duration(seconds: 1));
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
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CustomElevatedButton(
                  backgroundColor: Colors.black,
                  foregroundColor: const Color(0xFF36C8FD),
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
                    Routefly.pop(context);
                    if (viewModel.isQuizFinished) {
                      setState(() {
                        _audioPlayer.play(AssetSource('audio/defeat.mp3'));
                        _showFinalResults = true;
                      });
                    } else {
                      _audioPlayer.play(AssetSource('audio/progress.mp3'));
                      viewModel.nextQuestion();
                    }
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
    } // A lógica foi movida para os callbacks onPressed dos modais
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
                  const Icon(Icons.question_mark_rounded),
                  Text(
                    'Sair do Quiz',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                'Você realmente deseja sair do quiz? Você perderá seu progresso.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
              ),
              const SizedBox(height: 8),
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
      _backToModules();
    }
  }

  void _retryQuiz() {
    setState(() {
      _showFinalResults = false;
      canPop = false;
      canClose = false;
    });
    viewModel.resetQuiz();
    viewModel.loadQuiz(moduleId);
  }

  void _backToModules() {
    canPop = true;
    canClose = true;
    Routefly.pop(
      context,
      result: viewModel.isQuizFinished && viewModel.lives > 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, result) {
        _handleCloseQuiz();
      },
      child: Scaffold(
        appBar: _showFinalResults
            ? null
            : AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                onPressed: _handleCloseQuiz,
                icon: const Icon(Icons.close_outlined),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AnimatedBuilder(
                    animation: viewModel,
                    builder: (context, _) => ProgressBar(
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
                  builder: (context, _) =>
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
              return viewModel.lives <= 0
                  ? QuizDefeatState(
                totalXPEarned: viewModel.totalXPEarned,
                onRetry: _retryQuiz,
                onBackToModules: _backToModules,
              )
                  : QuizVictoryState(
                totalXPEarned: viewModel.totalXPEarned,
                onRetry: _retryQuiz,
                onBackToModules: _backToModules,
              );
            }

            final currentQuestion = viewModel.currentQuestion;
            if (currentQuestion == null) {
              return const Center(child: Text('Nenhuma questão disponível.'));
            }

            // Verificar se a questão é de revisão e se já foi respondida
            final isAnswered = currentQuestion.isResponded;

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Exibir o bloco verde de revisão somente se for uma questão de revisão e já tiver sido respondida
                        if (isAnswered)
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.info_outline, color: Colors.blue),
                                const SizedBox(width: 6),
                                Text(
                                  'Questão de Revisão',
                                  style: TextStyle(
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
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
                              (index) => TweenAnimationBuilder<Offset>(
                            key: ValueKey(
                                '${viewModel.currentQuestionIndex}-$index'),
                            duration: Duration(milliseconds: 300 + index * 100),
                            curve: Curves.easeOut,
                            tween: Tween<Offset>(
                              begin: const Offset(0, 0.2),
                              end: Offset.zero,
                            ),
                            builder: (context, offset, child) =>
                                Transform.translate(
                                  offset:
                                  offset * MediaQuery.of(context).size.height,
                                  child: child,
                                ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: QuizAlternative(
                                index: index,
                                text: currentQuestion.alternatives[index],
                                isSelected:
                                viewModel.selectedAnswerIndex == index,
                                showResult:
                                viewModel.selectedAnswerIndex != null,
                                isCorrect:
                                viewModel.selectedAnswerIndex != null &&
                                    index ==
                                        currentQuestion.correctAnswerIndex,
                                onTap: () => _handleAnswerSubmission(index),
                              ),
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
