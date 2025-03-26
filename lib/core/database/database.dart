import 'dart:developer';

import 'package:bcc_review_app/core/database/seed_data.dart';
import 'package:bcc_review_app/domain/entities/answer_user.dart';
import 'package:bcc_review_app/domain/entities/module.dart';
import 'package:bcc_review_app/domain/entities/question.dart';
import 'package:bcc_review_app/domain/entities/subject.dart';
import 'package:bcc_review_app/domain/entities/user.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class Database {
  Isar? _databaseInstance;

  Database._internal();

  static final Database _instance = Database._internal();

  factory Database() {
    return _instance;
  }

  Future<Isar> get connection async {
    if (_databaseInstance == null || !_databaseInstance!.isOpen) {
      await _openConnection();
    }
    return _databaseInstance!;
  }

  Future<void> _openConnection() async {
    if (_databaseInstance != null && _databaseInstance!.isOpen) {
      log('Database connection already open.');
      return;
    }
    try {
      final dir = await getApplicationDocumentsDirectory();
      _databaseInstance = await Isar.open(
        [
          SubjectSchema,
          UserSchema,
          AnswerUserSchema,
          ModuleSchema,
          MultipleChoiceSchema,
        ],
        directory: dir.path,
        inspector: kDebugMode,
        name: 'bccReviewAppDB',
      );
      log('Database connection opened successfully at ${dir.path}');
    } catch (e) {
      log('Error opening database connection: $e');
      rethrow;
    }
  }

  Future<void> init(SharedPreferences prefs) async {
    await connection; // Garante que a conexão esteja aberta
    await seed(prefs);
  }

  Future<void> seed(SharedPreferences prefs) async {
    // _resetData(); // ! Descomente se quiser limpar os dados antes de semear
    const seededKey = 'database_seeded_v1';
    if (prefs.getBool(seededKey) ?? false) {
      log('Database already seeded.');
      return;
    }

    log('Starting database seeding...');
    try {
      await _seedFromStructuredData();
      await prefs.setBool(seededKey, true);
      log('Database seeding completed successfully.');
    } catch (e) {
      log('Error during database seeding: $e');
    }
  }

  Future<void> _seedFromStructuredData() async {
    final isar = await connection;

    await isar.writeTxn(() async {
      for (final subjectData in seedSubjectsData) {
        // Salva as disciplinas
        final subject = Subject(
          name: subjectData['name'],
          description: subjectData['description'],
          period: subjectData['period'],
          icon: subjectData['icon'],
        );
        await isar.subjects.put(subject);
        // Lista para armazenar instâncias de módulos para vincular a cada disciplina depois
        final List<Module> subjectModuleInstances = [];

        if (subjectData['modules'] != null) {
          // Salva os módulos de cada disciplina
          for (final moduleData
              in subjectData['modules'] as List<Map<String, dynamic>>) {
            final module = Module(
              name: moduleData['name'],
              description: moduleData['description'],
              difficultyLevel: moduleData['difficultyLevel'],
              isOfficial: moduleData['isOfficial'],
            );

            module.subject.value = subject; // Vincula Module ao Subject
            await isar.modules.put(module); // Salva Module
            await module.subject.save(); // Salva o vínculo com Subject

            subjectModuleInstances.add(module);

            final List<MultipleChoice> moduleQuestionInstances = [];

            if (moduleData['questions'] != null) {
              // Salva as questões de cada módulo
              for (final questionData
                  in moduleData['questions'] as List<Map<String, dynamic>>) {
                if (questionData['type'] == QuestionType.multipleChoice) {
                  final question = MultipleChoice(
                    statement: questionData['statement'],
                    alternatives: List<String>.from(
                      questionData['alternatives'],
                    ),
                    correctAnswerIndex: questionData['correctAnswerIndex'],
                    xpInitial: questionData['xpInitial'],
                    xpReview: questionData['xpReview'],
                    isOfficial: questionData['isOfficial'],
                  );

                  question.module.value = module;
                  await isar.multipleChoices.put(question);
                  await question.module.save();

                  moduleQuestionInstances.add(question);
                }
                // Adicione outros tipos de perguntas aqui, se necessário
              }
            }
            // --- Salva Links Module -> Questions ---
            if (moduleQuestionInstances.isNotEmpty) {
              module.multipleChoiceQuestions.addAll(moduleQuestionInstances);
              await module.multipleChoiceQuestions.save();
            }
          }
        }
        // --- Salva Links Subject -> Modules ---
        if (subjectModuleInstances.isNotEmpty) {
          subject.modules.addAll(subjectModuleInstances);
          await subject.modules.save();
        }
        log('Seeded Subject: ${subject.name}');
      }
    });
  }

  Future<void> _resetData() async {
    final isar = await connection;
    await isar.writeTxn(() async {
      await isar.subjects.clear();
      // await isar.users.clear();
      await isar.answerUsers.clear();
      await isar.modules.clear();
      await isar.multipleChoices.clear();
      log('Database reset completed successfully.');
    });
  }

  Future<void> close() async {
    if (_databaseInstance != null && _databaseInstance!.isOpen) {
      await _databaseInstance!.close();
      _databaseInstance = null;
      log('Database connection closed.');
    }
  }
}
