import 'dart:async';

import 'package:flutter_comms/flutter_comms.dart';
import 'package:knam/common/clients/markdown_client.dart';
import 'package:knam/features/language/language.dart';

class MembersCubit extends ListenerCubit<MembersState, Language> {
  MembersCubit({
    required this.client,
    required Language language,
  }) : super(MembersInitial()) {
    init(language);
  }

  final MarkdownClient client;

  @override
  void onMessage(Language message) {
    init(Language.fromLanguageCode(message.toString()));
  }

  @override
  void onInitialMessage(Language message) => onMessage(message);

  Future<void> init(Language language) async {
    try {
      final markdown = await client.getMembers(language);
      emit(MembersLoaded(markdown: markdown));
    } catch (_, __) {
      emit(MembersError());
    }
  }
}

sealed class MembersState {}

final class MembersInitial extends MembersState {}

final class MembersLoaded extends MembersState {
  MembersLoaded({required this.markdown});

  final String markdown;
}

final class MembersError extends MembersState {}
