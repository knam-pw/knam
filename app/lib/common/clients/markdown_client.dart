import 'package:dio/dio.dart';
import 'package:knam/features/language/language.dart';

final class MarkdownClient {
  late final dio = Dio();

  static const _baseUrl = 'https://lewandowski-jan.github.io/knam-md/';

  Future<String> getHome(Language language) async {
    final url = '$_baseUrl$language/home/home.md';
    final response = await dio.get<dynamic>(url);

    return response.data as String;
  }

  Future<List<String>> getMeetings(Language language) async {
    final url = '$_baseUrl$language/meetings/meetings.md';
    final response = await dio.get<dynamic>(url);

    final data = response.data as String;

    return data.split('<<BREAK>>');
  }

  Future<List<String>> getNews(Language language) async {
    final url = '$_baseUrl$language/news/news.md';
    final response = await dio.get<dynamic>(url);

    final data = response.data as String;

    return data.split('<<BREAK>>');
  }

  Future<String> getMembers(Language language) async {
    final url = '$_baseUrl$language/members/members.md';
    final response = await dio.get<dynamic>(url);

    return response.data as String;
  }
}
