import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knam/common/l10n/l10n.dart';
import 'package:knam/common/theme/theme.dart';
import 'package:knam/common/utils/spaced.dart';
import 'package:knam/common/widgets/markdown.dart';
import 'package:knam/common/widgets/text.dart';
import 'package:knam/features/language/language.dart';
import 'package:knam/features/meetings/meetings_cubit.dart';

class MeetingsPage extends StatelessWidget {
  const MeetingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final language = Language.fromLanguageCode(context.locale.languageCode);

    return BlocProvider(
      create: (context) => MeetingsCubit(
        client: context.read(),
        language: language,
      ),
      child: BlocBuilder<MeetingsCubit, MeetingsState>(
        builder: (context, state) {
          return switch (state) {
            MeetingsInitial() =>
              const Center(child: CircularProgressIndicator()),
            MeetingsError() => Center(
                child: KMText(
                  'Unexpected error, try again later',
                  color: context.colors.error,
                ),
              ),
            MeetingsLoaded(meetings: final List<String> meetings) =>
              SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: meetings
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
