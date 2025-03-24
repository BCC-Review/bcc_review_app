import 'package:bcc_review_app/config/dependecies.dart';
import 'package:bcc_review_app/domain/entities/answer_user.dart';
import 'package:bcc_review_app/domain/entities/module.dart';
import 'package:bcc_review_app/domain/entities/question.dart';
import 'package:bcc_review_app/domain/entities/subject.dart';
import 'package:bcc_review_app/domain/entities/user.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class Database {
  Isar? _dabaseInstance;

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
}
