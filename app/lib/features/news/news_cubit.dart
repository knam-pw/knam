import 'dart:async';

import 'package:flutter_comms/flutter_comms.dart';
import 'package:knam/common/clients/markdown_client.dart';
import 'package:knam/features/language/language.dart';

class NewsCubit extends ListenerCubit<NewsState, Language> {
  NewsCubit({
    required this.client,
    required Language language,
  }) : super(NewsInitial()) {
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
      final news = await client.getNews(language);
      emit(NewsLoaded(news: news));
    } catch (_, __) {
      emit(NewsError());
    }
  }
}

sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoaded extends NewsState {
  NewsLoaded({required this.news});

  final List<String> news;
}

final class NewsError extends NewsState {}
