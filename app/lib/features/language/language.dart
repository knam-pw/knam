import 'package:flutter/material.dart';

enum Language {
  en,
  pl;

  const Language();

  static Language fromLanguageCode(String languageCode) {
    if (languageCode == 'en') {
      return Language.en;
    }

    return Language.pl;
  }

  Locale toLocale() => Locale(toString());

  @override
  String toString() => switch (this) {
        Language.en => 'en',
        Language.pl => 'pl',
      };
}
