import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knam/common/theme/theme.dart';
import 'package:knam/common/widgets/text.dart';
import 'package:knam/features/language/language.dart';
import 'package:knam/features/language/language_cubit.dart';

class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: context.read<LanguageCubit>().switchLanguage,
      icon: BlocBuilder<LanguageCubit, Language>(
        builder: (_, language) {
          late final String label;
          if (language.toString() == 'en') {
            label = Language.pl.toString();
          } else {
            label = Language.en.toString();
          }

          return KMText(label, style: context.styles.bodyLarge);
        },
      ),
    );
  }
}
