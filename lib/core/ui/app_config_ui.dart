import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppConfigUI {
  AppConfigUI._();

  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      // Roxo mais elétrico e vibrante
      primary: const Color(0xFF8A2BE2), // Um roxo mais intenso (BlueViolet)
      primaryContainer: const Color(0xFF5D1ECB), // Roxo mais profundo
      // Azul tech como secundário
      secondary: const Color(0xFF00FFFF), // Ciano neon
      secondaryContainer: const Color(0xFF00B4D8), // Ciano mais escuro
      // Rosa elétrico como terciário
      tertiary: const Color(0xFFFF00FF), // Magenta neon
      // Fundo mais escuro com tom azulado
      surface: const Color(0xFF0D0D20), // Quase preto com tom azulado
      // Vermelho mais neon para erro
      error: const Color(0xFFFF0055), // Vermelho neon
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.white,
      onError: Colors.white,
      brightness: Brightness.dark,
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0D0D20),
    primaryColor: const Color(0xFF8A2BE2),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Color(0xFFAA77FF), width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Color(0xFFBB88FF), width: 2.0),
      ),
      filled: true,
      fillColor: Color(0xFF151530),
      labelStyle: TextStyle(color: Colors.white70),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF8A2BE2),
        elevation: 4,
        shadowColor: const Color(0xFFAA77FF),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(4),
          ),
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: const Color(0xFF151530),
      elevation: 16,
      shadowColor: const Color(0xFF8A2BE2).withAlpha(40),
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: const Color(0xFFAA77FF).withAlpha(30),
          width: 1,
        ),
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Exo2',
    splashColor: const Color(0xFF00FFFF).withAlpha(20),
    highlightColor: const Color(0xFFAA77FF).withAlpha(15),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Exo2',
        fontWeight: FontWeight.w600,
        fontSize: 20,
        letterSpacing: 1.2,
        color: Colors.white,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xFF00FFFF),
      selectionColor: Color(0xFF00FFFF),
      selectionHandleColor: Color(0xFF00FFFF),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      // Roxo principal mais brilhante
      primary: const Color(0xFF8A2BE2), // Roxo vibrante
      primaryContainer: const Color(0xFFAA77FF), // Roxo mais claro
      // Azul tech como secundário
      secondary: const Color(0xFF00B4D8), // Ciano médio
      secondaryContainer: const Color(0xFF00FFFF), // Ciano neon
      // Magenta como terciário
      tertiary: const Color(0xFFE100FF), // Magenta mais vibrante
      // Fundo muito claro com toque de roxo
      surface: const Color(0xFFF5F0FF), // Branco com tom roxo
      // Vermelho mais vibrante
      error: const Color(0xFFE50057), // Vermelho mais vibrante
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: const Color(0xFF1A1040), // Roxo quase preto
      onError: Colors.white,
      brightness: Brightness.light,
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF5F0FF),
    primaryColor: const Color(0xFF8A2BE2),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Color(0xFFAA77FF), width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Color(0xFF8A2BE2), width: 2.0),
      ),
      filled: true,
      fillColor: Colors.white,
      labelStyle: TextStyle(color: Color(0xFF3A1A70)),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF8A2BE2),
        elevation: 2,
        shadowColor: const Color(0xFFAA77FF),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(4),
          ),
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 6,
      shadowColor: const Color(0xFF8A2BE2).withAlpha(20),
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: const Color(0xFFAA77FF).withAlpha(20),
          width: 1,
        ),
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Exo2',
    splashColor: const Color(0xFF00FFFF).withAlpha(15),
    highlightColor: const Color(0xFFAA77FF).withAlpha(10),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Exo2',
        fontWeight: FontWeight.w600,
        fontSize: 20,
        letterSpacing: 1.2,
        color: Color(0xFF1A1040),
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xFF00B4D8),
      selectionColor: Color(0xFF00FFFF),
      selectionHandleColor: Color(0xFF00B4D8),
    ),
  );
}
