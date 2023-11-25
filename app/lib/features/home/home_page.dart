import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knam/common/l10n/l10n.dart';
import 'package:knam/common/theme/theme.dart';
import 'package:knam/common/widgets/markdown.dart';
import 'package:knam/common/widgets/text.dart';
import 'package:knam/features/home/home_cubit.dart';
import 'package:knam/features/language/language.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final language = Language.fromLanguageCode(context.locale.languageCode);

    return BlocProvider(
      create: (context) => HomeCubit(
        client: context.read(),
        language: language,
      ),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return switch (state) {
            HomeInitial() => const Center(child: CircularProgressIndicator()),
            HomeError() => Center(
                child: KMText(
                  'Unexpected error, try again later',
                  color: context.colors.error,
                ),
              ),
            HomeLoaded(markdown: final String markdown) =>
              SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    KMMarkdown(markdown),
                  ],
                ),
              ),
          };
        },
      ),
    );
  }
}
