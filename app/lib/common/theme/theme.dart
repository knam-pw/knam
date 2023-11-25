import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knam/common/theme/colors.dart';

class KMTheme {
  static ThemeData light(BuildContext context) => _create(
        brightness: Brightness.light,
        colors: KMColors.ofBrightness(Brightness.light),
      );

  static ThemeData dark(BuildContext context) => _create(
        brightness: Brightness.dark,
        colors: KMColors.ofBrightness(Brightness.dark),
      );

  static ThemeData _create({
    required Brightness brightness,
    required KMColors colors,
  }) {
    return ThemeData.from(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: colors.primary,
        onPrimary: colors.text,
        secondary: colors.secondary,
        onSecondary: colors.text,
        error: colors.error,
        onError: colors.text,
        background: colors.background,
        onBackground: colors.text,
        surface: colors.surface,
        onSurface: colors.text,
      ),
      textTheme: GoogleFonts.latoTextTheme(
        TextTheme(
          displayLarge: TextStyle(
            color: colors.text,
          ),
          displayMedium: TextStyle(
            color: colors.text,
          ),
          displaySmall: TextStyle(
            color: colors.text,
          ),
          headlineMedium: TextStyle(
            color: colors.text,
          ),
          headlineSmall: TextStyle(
            color: colors.text,
          ),
          titleLarge: TextStyle(
            color: colors.text,
          ),
          titleMedium: TextStyle(
            color: colors.text,
          ),
          titleSmall: TextStyle(
            color: colors.text,
          ),
          bodyLarge: TextStyle(
            color: colors.text,
          ),
          bodyMedium: TextStyle(
            color: colors.text,
          ),
          labelLarge: TextStyle(
            color: colors.text,
          ),
          bodySmall: TextStyle(
            color: colors.text,
          ),
          labelSmall: TextStyle(
            color: colors.text,
          ),
        ),
      ),
    ).copyWith(
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          // splashFactory: NoSplash.splashFactory,
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(),
      splashColor: colors.transparent,
      highlightColor: colors.transparent,
      // splashFactory: NoSplash.splashFactory,
      scaffoldBackgroundColor: colors.background,
      cardColor: colors.surface,
      canvasColor: colors.background,
    );
  }
}

extension BuildContextTheme on BuildContext {
  KMColors get colors => KMColors.of(this);

  TextTheme get styles => Theme.of(this).textTheme;

  Brightness get brightness => Theme.of(this).brightness;

  bool get isDarkMode => brightness == Brightness.dark;
}

extension BrightnessX on Brightness {
  ThemeMode toThemeMode() {
    return switch (this) {
      Brightness.dark => ThemeMode.dark,
      Brightness.light => ThemeMode.light,
    };
  }
}
