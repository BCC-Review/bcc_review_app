import 'package:asuka/asuka.dart';
import 'package:bcc_review_app/data/repositories/module/module_repository.dart';
import 'package:bcc_review_app/data/repositories/user/user_repository.dart';
import 'package:bcc_review_app/domain/entities/module.dart';
import 'package:bcc_review_app/domain/entities/user.dart';
import 'package:flutter/widgets.dart';

class MyModulesViewModel extends ChangeNotifier {
  final UserRepository _userRepository;
  final ModuleRepository _moduleRepository;

  MyModulesViewModel(this._userRepository, this._moduleRepository);

  User? user;
  bool isLoading = false;
  final List<Module> _myModules = [];
  List<Module> filteredModules = [];
  String _searchQueryModules = "";
  String get searchQueryModules => _searchQueryModules;

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

  Future<void> getMyModules() async {
    isLoading = true;
    notifyListeners();
    await _moduleRepository.getMyModules()
      ..onSuccess((modules) {
        _myModules.clear();
        _myModules.addAll(modules);
        filteredModules = List.from(_myModules);
        isLoading = false;
        notifyListeners();
      })
      ..onFailure((error) {
        AsukaSnackbar.alert(error.toString()).show();
        isLoading = false;
        notifyListeners();
      });
  }

  void filterModules(String query) {
    _searchQueryModules = query.trim().toLowerCase();
    if (_searchQueryModules.isEmpty) {
      filteredModules = List.from(_myModules);
    } else {
      filteredModules =
          _myModules
              .where(
                (module) =>
                    module.name.toLowerCase().contains(_searchQueryModules),
              )
              .toList();
    }
    notifyListeners();
  }
}
