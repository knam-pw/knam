import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knam/common/l10n/l10n.dart';
import 'package:knam/common/theme/theme.dart';
import 'package:knam/common/widgets/markdown.dart';
import 'package:knam/common/widgets/text.dart';
import 'package:knam/features/language/language.dart';
import 'package:knam/features/members/members_cubit.dart';

class MembersPage extends StatelessWidget {
  const MembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final language = Language.fromLanguageCode(context.locale.languageCode);

    return BlocProvider(
      create: (context) => MembersCubit(
        client: context.read(),
        language: language,
      ),
      child: BlocBuilder<MembersCubit, MembersState>(
        builder: (context, state) {
          return switch (state) {
            MembersInitial() => const Center(child: CircularProgressIndicator()),
            MembersError() => Center(
                child: KMText(
                  'Unexpected error, try again later',
                  color: context.colors.error,
                ),
              ),
            MembersLoaded(markdown: final String markdown) =>
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
