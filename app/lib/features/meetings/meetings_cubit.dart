import 'dart:async';

import 'package:flutter_comms/flutter_comms.dart';
import 'package:knam/common/clients/markdown_client.dart';
import 'package:knam/features/language/language.dart';

class MeetingsCubit extends ListenerCubit<MeetingsState, Language> {
  MeetingsCubit({
    required this.client,
    required Language language,
  }) : super(MeetingsInitial()) {
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
      final meetings = await client.getMeetings(language);
      emit(MeetingsLoaded(meetings: meetings));
    } catch (_, __) {
      emit(MeetingsError());
    }
  }
}

sealed class MeetingsState {}

final class MeetingsInitial extends MeetingsState {}

final class MeetingsLoaded extends MeetingsState {
  MeetingsLoaded({required this.meetings});

  final List<String> meetings;
}

final class MeetingsError extends MeetingsState {}
