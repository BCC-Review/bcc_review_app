import 'package:asuka/asuka.dart';
import 'package:bcc_review_app/data/repositories/module/module_repository.dart';
import 'package:bcc_review_app/data/repositories/subject/subject_repository.dart';
import 'package:bcc_review_app/domain/entities/module.dart';
import 'package:bcc_review_app/domain/entities/subject.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

class ModuleShowViewModel extends ChangeNotifier {
  final ModuleRepository moduleRepository;
  final SubjectRepository subjectRepository;
  ModuleShowViewModel(this.moduleRepository, this.subjectRepository);

  final List<Module> _modules = [];

  List<Module> get modules => _modules;

  Subject? _subject;
  Subject? get subject => _subject;

  bool isLoading = false;

  Future<void> refreshModules(int subjectId) async {
    isLoading = true;
    notifyListeners();

    await subjectRepository
        .getSubject(subjectId)
        .onSuccess((subject) {
          _subject = subject;
          notifyListeners();
          moduleRepository.getModulesFromSubject(subject)
            ..onSuccess((modules) {
              _modules.clear();
              _modules.addAll(modules);
              isLoading = false;
              notifyListeners();
            })
            ..onFailure((error) {
              isLoading = false;
              notifyListeners();
              AsukaSnackbar.alert(error.toString()).show();
            });
        })
        .onFailure((error) {
          isLoading = false;
          notifyListeners();
          AsukaSnackbar.alert(error.toString()).show();
        });
  }
}
