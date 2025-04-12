import 'package:bcc_review_app/core/extensions/date_only_compare.dart';
import 'package:bcc_review_app/data/repositories/module/module_repository.dart';
import 'package:bcc_review_app/data/repositories/question/question_repository.dart';
import 'package:bcc_review_app/data/repositories/user/user_repository.dart';
import 'package:bcc_review_app/domain/entities/module.dart';
import 'package:bcc_review_app/domain/entities/question.dart';
import 'package:bcc_review_app/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

class QuizViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final QuestionRepository questionRepository;
  final ModuleRepository moduleRepository;

  QuizViewModel(
    this.userRepository,
    this.questionRepository,
    this.moduleRepository,
  );

  bool isLoading = false;
  String? errorMessage;
  List<MultipleChoice> quizQuestions = [];
  List<MultipleChoice> questionsToUpdate = [];
  List<MultipleChoice> get answeredQuestions =>
      quizQuestions.where((question) => question.isResponded).toList();
  int currentQuestionIndex = 0;
  int lives = 3;
  int totalXPEarned = 0;
  int? selectedAnswerIndex;
  Module? module;

  MultipleChoice? get currentQuestion =>
      quizQuestions.isNotEmpty && currentQuestionIndex < quizQuestions.length
          ? quizQuestions[currentQuestionIndex]
          : null;

  bool get hasNextQuestion => currentQuestionIndex < quizQuestions.length - 1;
  bool get isQuizFinished => lives <= 0 || !hasNextQuestion;
  bool get isQuizSuccessful =>
      lives > 0 && currentQuestionIndex == quizQuestions.length - 1;
  bool get isQuizFailed => lives <= 0;

  Future<void> loadQuiz(int moduleId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Carregar o módulo
    final resultModule = await moduleRepository.getModule(moduleId);
    resultModule.fold(
      (success) {
        module = success;
      },
      (failure) {
        errorMessage = failure.toString();
        isLoading = false;
        notifyListeners();
      },
    );

    final resultQuestions = await questionRepository.getQuizQuestions(moduleId);

    resultQuestions.fold(
      (success) {
        quizQuestions = success;
        currentQuestionIndex = 0;
        lives = quizQuestions.length > 3 ? 3 : quizQuestions.length;
        totalXPEarned = 0;
        selectedAnswerIndex = null;
      },
      (failure) {
        errorMessage = failure.toString();
      },
    );

    isLoading = false;
    notifyListeners();
  }

  void resetQuiz() {
    quizQuestions.clear();
    currentQuestionIndex = 0;
    lives = 3;
    totalXPEarned = 0;
    selectedAnswerIndex = null;
    module = null;
    errorMessage = null;
    isLoading = false;
    notifyListeners();
  }

  Future<bool> submitAnswer(int answerIndex) async {
    if (currentQuestion == null) return false;

    selectedAnswerIndex = answerIndex;
    final isCorrect = currentQuestion!.checkAnswer(answerIndex);

    if (isCorrect && currentQuestion!.isResponded) {
      totalXPEarned += currentQuestion!.xpReview;
      questionsToUpdate.add(currentQuestion!);
    } else if (isCorrect) {
      currentQuestion!.isResponded = true;
      totalXPEarned += currentQuestion!.xpInitial;
      questionsToUpdate.add(currentQuestion!);
    } else {
      lives--;
    }
    if (isQuizSuccessful) {
      await saveQuizResults();
    }
    notifyListeners();
    return isCorrect;
  }

  Future<void> saveQuizResults() async {
    for (var question in answeredQuestions) {
      final result = await questionRepository.updateMultipleChoiceQuestion(
        question,
      );
      result.fold(
        (success) {
          // success
        },
        (failure) {
          errorMessage = failure.toString();
        },
      );
    }

    User? user;

    await userRepository
        .getUser()
        .onSuccess((fetchedUser) {
          user = fetchedUser;
        })
        .onFailure((error) {
          errorMessage = error.toString();
        });

    user?.totalXp += totalXPEarned;
    user?.updateLevel();
    if (user?.lastDailySequenceDate == null ||
        user?.lastDailySequenceDate!.isSameDate(DateTime.now()) == false) {
      user?.dailySequence++;
      user?.lastDailySequenceDate = DateTime.now();
    }

    await userRepository.updateUser(user!);
  }

  void nextQuestion() {
    if (!hasNextQuestion || isQuizFinished) return;

    currentQuestionIndex++;
    selectedAnswerIndex = null;
    notifyListeners();
  }
}
