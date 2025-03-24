import 'package:bcc_review_app/core/ui/app_config_ui.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

import 'app_widget.route.dart';

part 'app_widget.g.dart';

@Main('lib/ui')
class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BCC Review',
      theme: AppConfigUI.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: Routefly.routerConfig(
        routes: routes,
        initialPath: routePaths.splash,
      ),
    );
  }
}
