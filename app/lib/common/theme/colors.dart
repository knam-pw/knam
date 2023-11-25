import 'package:flutter/material.dart';

part 'colors_light.dart';
part 'colors_dark.dart';

class KMColor extends Color {
  const KMColor._(super.value);
}

abstract interface class KMColors {
  const KMColors();

  static KMColors of(BuildContext context) =>
      KMColors.ofBrightness(Theme.of(context).brightness);

  static KMColors ofBrightness(Brightness brightness) {
    switch (brightness) {
      case Brightness.light:
        return const _KMColorsLight();
      case Brightness.dark:
        return const _KMColorsDark();
    }
  }

  KMColor get primary;
  KMColor get onPrimary;

  KMColor get secondary;

  KMColor get background;
  KMColor get surface;

  KMColor get text;

  KMColor get transparent;

  KMColor get error;
}
