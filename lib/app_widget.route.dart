// GENERATED FILE. PLEASE DO NOT EDIT THIS FILE!!

import 'package:flutter/widgets.dart';
import 'package:routefly/routefly.dart';

import 'ui/home/home_page.dart' as a4;
import 'ui/login/login_page.dart' as a2;
import 'ui/minigames/minigame_selection_page.dart' as a0;
import 'ui/minigames/snake/snake_game_page.dart' as a1;
import 'ui/module/[id]/show_page.dart' as a7;
import 'ui/module/create/create_module_page.dart' as a8;
import 'ui/module/create_questions/[moduleId]/form_questions_page.dart' as a9;
import 'ui/quiz/[moduleId]/quiz_page.dart' as a6;
import 'ui/quiz/[id]/explanation/explanation_page.dart' as a5;
import 'ui/settings/settings_page.dart' as a10;
import 'ui/splash/splash_page.dart' as a3;

Route b0Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.MinigameSelectionPage(),
    );
Route b1Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(ctx, settings, const a1.SnakeGamePage());
Route b2Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(ctx, settings, const a2.LoginPage());
Route b3Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(ctx, settings, const a3.SplashPage());
Route b4Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(ctx, settings, const a4.HomePage());
Route b5Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(ctx, settings, const a5.ExplanationPage());
Route b6Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(ctx, settings, const a6.QuizPage());
Route b7Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(ctx, settings, const a7.ModulePage());
Route b8Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(ctx, settings, const a8.CreateModulePage());
Route b9Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(ctx, settings, const a9.CreateQuestionsPage());
Route b10Builder(BuildContext ctx, RouteSettings settings) =>
    Routefly.defaultRouteBuilder(ctx, settings, const a10.SettingsPage());
