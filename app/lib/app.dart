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
    return BlocBuilder<BrightnessCubit, Brightness?>(
      builder: (context, brightness) {
        final platformBrightness = MediaQuery.platformBrightnessOf(context);
        if (brightness == null) {
          context.read<BrightnessCubit>().setBrightness(platformBrightness);
        }
        final currentBrightness = brightness ?? platformBrightness;

        return BlocBuilder<LanguageCubit, Language>(
          builder: (context, language) {
            final surfaceColor = currentBrightness == Brightness.light
                ? const Color(0xFFF1F1F1)
                : const Color(0xFF222222);

            return MaterialApp.router(
              onGenerateTitle: (context) => context.s.app_title,
              localizationsDelegates: const [
                ...AppLocalizations.localizationsDelegates,
                DefaultMaterialLocalizations.delegate,
              ],
              color: surfaceColor,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: language.toLocale(),
              theme: KMTheme.light(context),
              darkTheme: KMTheme.dark(context),
              themeMode: currentBrightness.toThemeMode(),
              routerConfig: context.read<KMRouter>().router,
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
