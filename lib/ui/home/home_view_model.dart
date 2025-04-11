import 'package:asuka/asuka.dart';
import 'package:bcc_review_app/data/repositories/subject/subject_repository.dart';
import 'package:bcc_review_app/data/repositories/user/user_repository.dart';
import 'package:bcc_review_app/domain/entities/subject.dart';
import 'package:bcc_review_app/domain/entities/user.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final UserRepository _userRepository;
  final SubjectRepository _subjectRepository;
  HomeViewModel(this._subjectRepository, this._userRepository);

  User? user;
  bool isLoading = false;
  final List<Subject> _subjects = [];
  List<Subject> _filteredSubjects = [];
  String _searchQuery = "";

  List<MapEntry<int, List<Subject>>> get subjectsGroupedByPeriod {
    final List<Subject> source =
        _searchQuery.isEmpty ? _subjects : _filteredSubjects;
    final Map<int, List<Subject>> groupedSubjects = {};

    for (var subject in source) {
      if (groupedSubjects[subject.period] == null) {
        groupedSubjects[subject.period] = [];
      }
      groupedSubjects[subject.period]!.add(subject);
    }

    return groupedSubjects.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));
  }

  Future<void> getUser() async {
    await _userRepository.getUser()
      ..onSuccess((user) {
        this.user = user;
        notifyListeners();
      })
      ..onFailure((error) {
        AsukaSnackbar.alert(error.toString()).show();
      });
  }

  Future<void> refreshSubjects() async {
    isLoading = true;
    notifyListeners();

    await _subjectRepository.getSubjects()
      ..onSuccess((subjects) {
        _subjects.clear();
        _subjects.addAll(subjects);
        _filteredSubjects = List.from(_subjects);
        isLoading = false;
        notifyListeners();
      })
      ..onFailure((error) {
        isLoading = false;
        notifyListeners();
        AsukaSnackbar.alert(error.toString()).show();
      });
  }

  void filterSubjects(String query) {
    _searchQuery = query.trim().toLowerCase();
    if (_searchQuery.isEmpty) {
      _filteredSubjects = List.from(_subjects);
    } else {
      _filteredSubjects =
          _subjects
              .where(
                (subject) => subject.name.toLowerCase().contains(_searchQuery),
              )
              .toList();
    }
    notifyListeners();
  }
}
