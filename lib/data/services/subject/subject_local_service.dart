import 'package:bcc_review_app/core/database/database.dart';
import 'package:bcc_review_app/data/exceptions/subject_local_service_exception.dart';
import 'package:bcc_review_app/domain/entities/subject.dart';
import 'package:isar/isar.dart';
import 'package:result_dart/result_dart.dart';

class SubjectLocalService {
  final Database _database;

  SubjectLocalService(this._database);

  AsyncResult<List<Subject>> getSubjects() async {
    try {
      final connection = await _database.openConnection();
      final allSubjects = await connection.subjects.where().findAll();
      return Success(allSubjects);
    } catch (e, s) {
      return Failure(SubjectLocalServiceException(e.toString(), s));
    }
  }

  AsyncResult<Subject> getSubject(int subjectId) async {
    try {
      final connection = await _database.openConnection();
      final subject = await connection.subjects.get(subjectId);
      if (subject == null) {
        return Failure(SubjectNotFoundException('Disciplina não encontrada'));
      }
      return Success(subject);
    } catch (e, s) {
      return Failure(SubjectLocalServiceException(e.toString(), s));
    }
  }

  AsyncResult<int> addSubject(Subject subject) async {
    try {
      final connection = await _database.openConnection();
      int id = await connection.subjects.put(subject);
      return Success(id);
    } catch (e, s) {
      return Failure(SubjectLocalServiceException(e.toString(), s));
    }
  }

  AsyncResult<Unit> updateSubject(Subject subject) async {
    try {
      final connection = await _database.openConnection();
      await connection.subjects.put(subject);
      return Success(unit);
    } catch (e, s) {
      return Failure(SubjectLocalServiceException(e.toString(), s));
    }
  }

  AsyncResult<Unit> deleteSubject(int subjectId) async {
    try {
      final connection = await _database.openConnection();
      await connection.subjects.delete(subjectId);
      return Success(unit);
    } catch (e, s) {
      return Failure(SubjectLocalServiceException(e.toString(), s));
    }
  }
}
