import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knam/common/l10n/app_localizations.dart';
import 'package:knam/common/l10n/l10n.dart';
import 'package:knam/common/router/router.dart';
import 'package:knam/common/theme/theme.dart';
import 'package:knam/features/brightness/brightness_cubit.dart';
import 'package:knam/features/language/language.dart';
import 'package:knam/features/language/language_cubit.dart';

class KMApp extends StatelessWidget {
  const KMApp({super.key});

  @override
  Widget build(BuildContext context) {
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    final brightness = context.watch<BrightnessCubit>().state;

    if (brightness == null) {
      context.read<BrightnessCubit>().setBrightness(platformBrightness);
    }

    return BlocBuilder<LanguageCubit, Language>(
      builder: (context, language) {
        return MaterialApp.router(
          onGenerateTitle: (context) => context.s.app_title,
          localizationsDelegates: const [
            ...AppLocalizations.localizationsDelegates,
            DefaultMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: language.toLocale(),
          theme: KMTheme.light(context),
          darkTheme: KMTheme.dark(context),
          themeMode: (brightness ?? platformBrightness).toThemeMode(),
          routerConfig: context.read<KMRouter>().router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
