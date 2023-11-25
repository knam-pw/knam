import 'dart:async';

import 'package:flutter_comms/flutter_comms.dart';
import 'package:knam/common/clients/markdown_client.dart';
import 'package:knam/features/language/language.dart';

class HomeCubit extends ListenerCubit<HomeState, Language> {
  HomeCubit({
    required this.client,
    required Language language,
  }) : super(HomeInitial()) {
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
      final markdown = await client.getHome(language);
      emit(HomeLoaded(markdown: markdown));
    } catch (_, __) {
      emit(HomeError());
    }
  }
}

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoaded extends HomeState {
  HomeLoaded({required this.markdown});

  final String markdown;
}

final class HomeError extends HomeState {}
