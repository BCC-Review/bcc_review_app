import 'package:bcc_review_app/config/dependecies.dart';
import 'package:bcc_review_app/core/ui/app_config_ui.dart';
import 'package:bcc_review_app/data/repositories/settings/settings_repository.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

import 'app_widget.route.dart';

part 'app_widget.g.dart';

@Main('lib/ui')
class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final settingsRepository = injector.get<SettingsRepository>();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsRepository,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'BCC Review',
          theme:
              settingsRepository.isDarkMode
                  ? AppConfigUI.darkTheme
                  : AppConfigUI.lightTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: Routefly.routerConfig(
            routes: routes,
            initialPath: routePaths.splash,
          ),
        );
      },
    );
  }
}
