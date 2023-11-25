import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:knam/common/router/transition_builders.dart';
import 'package:knam/common/widgets/scaffold.dart';
import 'package:knam/features/home/home_page.dart';
import 'package:knam/features/meetings/meetings_page.dart';
import 'package:knam/features/members/members_page.dart';
import 'package:knam/features/news/news_page.dart';

part 'routes.g.dart';

class RoutePath {
  static const home = '/';
  static const meetings = '/meetings';
  static const news = '/news';
  static const members = '/members';

  static const tabs = [home, meetings, news, members];

  static String getTabPathFor({required int index}) {
    return tabs[index];
  }
}

@TypedShellRoute<MainRoute>(
  routes: [
    TypedGoRoute<HomeRoute>(
      path: RoutePath.home,
    ),
    TypedGoRoute<MeetingsRoute>(
      path: RoutePath.meetings,
    ),
    TypedGoRoute<NewsRoute>(
      path: RoutePath.news,
    ),
    TypedGoRoute<MembersRoute>(
      path: RoutePath.members,
    ),
  ],
)
class MainRoute extends ShellRouteData {
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return KMScaffold(body: navigator);
  }
}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const HomePage(),
      transitionsBuilder: TransitionBuilders.fadeInOut,
    );
  }
}

class MeetingsRoute extends GoRouteData {
  const MeetingsRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const MeetingsPage(),
      transitionsBuilder: TransitionBuilders.fadeInOut,
    );
  }
}

class NewsRoute extends GoRouteData {
  const NewsRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const NewsPage(),
      transitionsBuilder: TransitionBuilders.fadeInOut,
    );
  }
}

class MembersRoute extends GoRouteData {
  const MembersRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const MembersPage(),
      transitionsBuilder: TransitionBuilders.fadeInOut,
    );
  }
}
