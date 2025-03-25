import 'package:bcc_review_app/app_widget.dart';
import 'package:bcc_review_app/config/dependecies.dart';
import 'package:bcc_review_app/core/database/database.dart';
import 'package:bcc_review_app/core/ui/widgets/logo_widget.dart';
import 'package:bcc_review_app/data/repositories/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final Database database;
  late final UserRepository userRepository;

  @override
  void initState() {
    super.initState();
    database = injector.get<Database>();
    userRepository = injector.get<UserRepository>();
    init();
  }

  init() async {
    await database.openConnection();
    await database.seed(injector.get<SharedPreferences>());
    final user = await userRepository.getUser();
    await Future.delayed(const Duration(seconds: 2));
    if (user.isSuccess()) {
      Routefly.navigate(routePaths.home);
    } else {
      Routefly.navigate(routePaths.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: SizedBox(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LogoWidget(),
              CircularProgressIndicator(
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
