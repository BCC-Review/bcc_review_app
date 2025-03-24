import 'package:bcc_review_app/data/services/subject/subject_local_service.dart';
import 'package:bcc_review_app/domain/entities/subject.dart';
import 'package:result_dart/result_dart.dart';

import 'subject_repository.dart';

class SubjectRepositoryImpl implements SubjectRepository {
  final SubjectLocalService _subjectLocalService;

  SubjectRepositoryImpl(this._subjectLocalService);

  @override
  AsyncResult<int> addSubject(Subject subject) {
    return _subjectLocalService.addSubject(subject);
  }

  @override
  AsyncResult<Unit> deleteSubject(int id) {
    return _subjectLocalService.deleteSubject(id);
  }

  @override
  AsyncResult<Subject> getSubject(int id) {
    return _subjectLocalService.getSubject(id);
  }

  @override
  AsyncResult<List<Subject>> getSubjects() {
    return _subjectLocalService.getSubjects();
  }

  @override
  AsyncResult<Unit> updateSubject(Subject subject) {
    return _subjectLocalService.updateSubject(subject);
  }
}
