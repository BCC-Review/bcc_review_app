import 'package:auto_injector/auto_injector.dart';
import 'package:bcc_review_app/core/database/database.dart';
import 'package:bcc_review_app/data/repositories/module/module_repository.dart';
import 'package:bcc_review_app/data/repositories/module/module_repository_impl.dart';
import 'package:bcc_review_app/data/repositories/question/question_repository_impl.dart';
import 'package:bcc_review_app/data/repositories/settings/settings_repository.dart';
import 'package:bcc_review_app/data/repositories/settings/settings_repository_impl.dart';
import 'package:bcc_review_app/data/repositories/subject/subject_repository.dart';
import 'package:bcc_review_app/data/repositories/subject/subject_repository_impl.dart';
import 'package:bcc_review_app/data/repositories/user/user_repository.dart';
import 'package:bcc_review_app/data/repositories/user/user_repository_impl.dart';
import 'package:bcc_review_app/data/repositories/question/question_repository.dart';
import 'package:bcc_review_app/data/services/module/module_local_service.dart';
import 'package:bcc_review_app/data/services/question/question_local_service.dart';
import 'package:bcc_review_app/data/services/settings/local_storage_preferences_service.dart';
import 'package:bcc_review_app/data/services/subject/subject_local_service.dart';
import 'package:bcc_review_app/data/services/user/user_local_service.dart';
import 'package:bcc_review_app/ui/home/home_view_model.dart';
import 'package:bcc_review_app/ui/home/my_modules/my_modules_view.dart';
import 'package:bcc_review_app/ui/home/my_modules/my_modules_view_model.dart';
import 'package:bcc_review_app/ui/home/official_modules/official_modules_view_model.dart';
import 'package:bcc_review_app/ui/login/login_view_model.dart';
import 'package:bcc_review_app/ui/module/%5Bid%5D/module_show_view_model.dart';
import 'package:bcc_review_app/ui/module/create/create_module_view_model.dart';
import 'package:bcc_review_app/ui/module/create_questions/%5BmoduleId%5D/form_questions_view_model.dart';
import 'package:bcc_review_app/ui/quiz/%5BmoduleId%5D/quiz_view_model.dart';
import 'package:bcc_review_app/ui/quiz/%5Bid%5D/explanation/explanation_view_model.dart';
import 'package:bcc_review_app/ui/settings/settings_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = AutoInjector();

Future<void> setupDependencies() async {
  injector.addSingleton(Database.new);

  // Module dependencies
  injector.addLazySingleton<ModuleLocalService>(ModuleLocalService.new);
  injector.addLazySingleton<ModuleRepository>(ModuleRepositoryImpl.new);

  // Question dependecies
  injector.addLazySingleton<QuestionLocalService>(QuestionLocalService.new);
  injector.addLazySingleton<QuestionRepository>(QuestionRepositoryImpl.new);

  // Subject dependencies
  injector.addLazySingleton<SubjectLocalService>(SubjectLocalService.new);
  injector.addLazySingleton<SubjectRepository>(SubjectRepositoryImpl.new);

  // User dependencies
  injector.addLazySingleton<UserLocalService>(UserLocalService.new);
  injector.addLazySingleton<UserRepository>(UserRepositoryImpl.new);

  injector.addLazySingleton(LoginViewModel.new);
  injector.addLazySingleton(HomeViewModel.new);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  injector.addInstance<SharedPreferences>(prefs);
  injector.addSingleton(LocalStoragePreferencesService.new);
  // Atualiza o registro para injetar Database e SharedPreferences
  injector.addSingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(
      injector.get<LocalStoragePreferencesService>(),
      injector.get<Database>(),
      injector.get<SharedPreferences>(),
    ),
  );

  injector.addLazySingleton(SettingsViewModel.new);
  injector.addLazySingleton(ModuleShowViewModel.new);
  injector.addLazySingleton(QuizViewModel.new);
  injector.addLazySingleton(CreateModuleViewModel.new);
  injector.addLazySingleton(OfficialModulesViewModel.new);
  injector.addLazySingleton(MyModulesViewModel.new);
  injector.add(FormQuestionsViewModel.new);
  injector.add(ExplanationViewModel.new);

  injector.commit();
}
