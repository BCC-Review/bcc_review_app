import 'package:auto_injector/auto_injector.dart';
import 'package:bcc_review_app/core/database/database.dart';
import 'package:bcc_review_app/data/repositories/subject/subject_repository.dart';
import 'package:bcc_review_app/data/repositories/subject/subject_repository_impl.dart';
import 'package:bcc_review_app/data/repositories/user/user_repository.dart';
import 'package:bcc_review_app/data/repositories/user/user_repository_impl.dart';
import 'package:bcc_review_app/data/services/subject/subject_local_service.dart';
import 'package:bcc_review_app/data/services/user/user_local_service.dart';
import 'package:bcc_review_app/ui/home/home_view_model.dart';
import 'package:bcc_review_app/ui/login/login_view_model.dart';

final injector = AutoInjector();

void setupDependencies() {
  injector.addSingleton(Database.new);

  // Subject dependencies
  injector.addLazySingleton<SubjectLocalService>(SubjectLocalService.new);
  injector.addLazySingleton<SubjectRepository>(SubjectRepositoryImpl.new);

  // User dependencies
  injector.addLazySingleton<UserLocalService>(UserLocalService.new);
  injector.addLazySingleton<UserRepository>(UserRepositoryImpl.new);

  injector.addLazySingleton(LoginViewModel.new);
  injector.addLazySingleton(HomeViewModel.new);

  injector.commit();
}
