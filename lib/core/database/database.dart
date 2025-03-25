import 'package:bcc_review_app/domain/entities/answer_user.dart';
import 'package:bcc_review_app/domain/entities/module.dart';
import 'package:bcc_review_app/domain/entities/question.dart';
import 'package:bcc_review_app/domain/entities/subject.dart';
import 'package:bcc_review_app/domain/entities/user.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Database {
  Isar? _dabaseInstance;

  Database() {
    init();
  }

  Future<Isar> openConnection() async {
    if (_dabaseInstance == null) {
      final dir = await getApplicationDocumentsDirectory();
      _dabaseInstance = await Isar.open(
        [
          SubjectSchema,
          UserSchema,
          AnswerUserSchema,
          ModuleSchema,
          MultipleChoiceSchema,
        ],
        directory: dir.path,
        inspector: true,
      );
      return _dabaseInstance!;
    }

    return _dabaseInstance!;
  }

  Future<void> init() async {
    final db = await openConnection();
  }

  Future<void> seed(SharedPreferences prefs) async {
    if (prefs.getBool('seeded') == null || prefs.getBool('seeded') == false) {
      await _seedDefaultData();
      prefs.setBool('seeded', true);
    }
  }

  Future<void> _seedDefaultData() async {
    final db = await openConnection();

    // Criar Subject
    final subject = Subject(
      name: 'Introdução à Programação',
      description: 'Introdução à Programação',
      period: 1,
      icon: 'phone_android',
    );

    await db.writeTxn(() async {
      await db.subjects.put(subject);
    });

    // Criar Module e vincular ao Subject
    final module = Module(
      name: 'Algoritmos e Lógica de Programação',
      description: 'Fundamentos de algoritmos...',
      difficultyLevel: DifficultyLevel.easy,
      isOfficial: true,
    );

    module.subject.value = subject;
    await db.writeTxn(() async {
      await db.modules.put(module);
      await module.subject.save();
      subject.modules.add(module);
      await subject.modules.save();
    });

    // Criar Question e vincular ao Module
    final question = MultipleChoice(
      statement: 'Qual é a saída do seguinte código: print(2 + 2)?',
      alternatives: ['4', '22', 'Erro de Sintaxe', 'Nenhuma das alternativas'],
      correctAnswerIndex: 0,
      xpInitial: 10,
      xpReview: 3,
      isOfficial: true,
    );

    question.module.value = module;
    await db.writeTxn(() async {
      await db.multipleChoices.put(question);
      await question.module.save();
      module.multipleChoiceQuestions.add(question);
      await module.multipleChoiceQuestions.save();
    });
  }

  Future<void> _seedDefaultData2() async {
    final db = await openConnection();
    List<Subject> periodo1 = [
      Subject(
        name: 'Introdução à Programação',
        description: 'Introdução à Programação',
        period: 1,
        icon: 'phone_android',
      ),
    ];

    final subjectModules = {
      'Introdução à Programação': [
        Module(
          name: 'Algoritmos e Lógica de Programação',
          description:
              'Fundamentos de algoritmos, estruturas de decisão e repetição, e lógica básica de programação.',
          difficultyLevel: DifficultyLevel.easy,
          isOfficial: true,
        ),
        Module(
          name: 'Variáveis e Tipos de Dados',
          description:
              'Aprendizado sobre diferentes tipos de dados, declaração de variáveis e operações básicas.',
          difficultyLevel: DifficultyLevel.medium,
          isOfficial: true,
        ),
        Module(
          name: 'Estruturas de Dados Fundamentais',
          description:
              'Introdução a arrays, listas, pilhas e filas para armazenamento e manipulação de dados.',
          difficultyLevel: DifficultyLevel.medium,
          isOfficial: true,
        ),
      ],
    };

    final moduleQuestions = {
      'Algoritmos e Lógica de Programação': [
        MultipleChoice(
          statement: 'Qual é a saída do seguinte código: print(2 + 2)?',
          alternatives: [
            '4',
            '22',
            'Erro de Sintaxe',
            'Nenhuma das alternativas',
          ],
          correctAnswerIndex: 0,
          isOfficial: true,
          xpInitial: 10,
          xpReview: 3,
        ),
      ],
    };
  }
}
