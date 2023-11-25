import 'package:collection/collection.dart';
import 'package:go_router/go_router.dart';
import 'package:knam/common/router/routes.dart';
import 'package:url_strategy/url_strategy.dart';

class KMRouter {
  GoRouter get router => _router;

  List<RouteBase> get routes => $appRoutes;

  late final List<String> _allPaths;
  late final GoRouter _router = GoRouter(
    routes: routes,
    initialLocation: RoutePath.home,
    redirect: (context, state) {
      if (!_allPaths.contains(state.fullPath)) {
        return RoutePath.home;
      }

      return state.matchedLocation;
    },
  );

  static void setUrlStrategy() {
    setPathUrlStrategy();
  }

  void init() {
    _allPaths = routes
        .map((route) {
          if (route is GoRoute) {
            return route.path;
          }
        })
        .whereNotNull()
        .toList()
        ..addAll(RoutePath.tabs);
  }
}
