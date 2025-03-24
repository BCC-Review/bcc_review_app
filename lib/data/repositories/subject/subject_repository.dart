import 'package:bcc_review_app/domain/entities/subject.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class SubjectRepository {
  AsyncResult<List<Subject>> getSubjects();
  AsyncResult<Subject> getSubject(int id);
  AsyncResult<int> addSubject(Subject subject);
  AsyncResult<Unit> updateSubject(Subject subject);
  AsyncResult<Unit> deleteSubject(int id);
}
