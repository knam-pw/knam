import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knam/common/l10n/l10n.dart';
import 'package:knam/common/theme/theme.dart';
import 'package:knam/common/utils/spaced.dart';
import 'package:knam/common/widgets/markdown.dart';
import 'package:knam/common/widgets/text.dart';
import 'package:knam/features/language/language.dart';
import 'package:knam/features/news/news_cubit.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final language = Language.fromLanguageCode(context.locale.languageCode);

    return BlocProvider(
      create: (context) => NewsCubit(
        client: context.read(),
        language: language,
      ),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return switch (state) {
            NewsInitial() =>
              const Center(child: CircularProgressIndicator()),
            NewsError() => Center(
                child: KMText(
                  'Unexpected error, try again later',
                  color: context.colors.error,
                ),
              ),
            NewsLoaded(news: final List<String> news) =>
              SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: news
                      .map(
                        KMMarkdown.new,
                      )
                      .spaced(16),
                ),
              ),
          };
        },
      ),
    );
  }
}
