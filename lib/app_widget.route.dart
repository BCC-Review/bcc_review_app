// GENERATED FILE. PLEASE DO NOT EDIT THIS FILE!!

import 'package:flutter/widgets.dart';
import 'package:routefly/routefly.dart';

import 'ui/home/home_page.dart' as a0;
import 'ui/login/login_page.dart' as a1;
import 'ui/minigames/minigame_selection_page.dart' as a2;
import 'ui/minigames/snake/snake_game_page.dart' as a3;
import 'ui/module/[id]/show_page.dart' as a4;
import 'ui/quiz/[id]/quiz_page.dart' as a5;
import 'ui/settings/settings_page.dart' as a6;
import 'ui/splash/splash_page.dart' as a7;

Route b0Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(ctx, settings, const a0.HomePage());
Route b1Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(ctx, settings, const a1.LoginPage());
Route b2Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.MinigameSelectionPage(),
    );
Route b3Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(ctx, settings, const a3.SnakeGamePage());
Route b4Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(ctx, settings, const a4.ModulePage());
Route b5Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(ctx, settings, const a5.QuizPage());
Route b6Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(ctx, settings, const a6.SettingsPage());
Route b7Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(ctx, settings, const a7.SplashPage());
