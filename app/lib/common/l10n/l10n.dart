import 'package:flutter/material.dart';
import 'package:knam/common/l10n/app_localizations.dart';

extension BuildContextL10nExtension on BuildContext {
  AppLocalizations get s => AppLocalizations.of(this)!;

  Locale get locale => Localizations.localeOf(this);
}
