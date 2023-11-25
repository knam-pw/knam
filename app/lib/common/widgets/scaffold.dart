import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:knam/common/l10n/l10n.dart';
import 'package:knam/common/router/routes.dart';
import 'package:knam/common/theme/theme.dart';
import 'package:knam/common/widgets/side_panel.dart';
import 'package:knam/common/widgets/text.dart';
import 'package:knam/features/brightness/brightness_switch.dart';
import 'package:knam/features/language/language_switch.dart';

class KMScaffold extends StatelessWidget {
  const KMScaffold({
    super.key,
    required this.body,
  });

  final Widget body;

  String _getLabelForRoutePath(BuildContext context, String routePath) {
    return switch (routePath) {
      RoutePath.home => context.s.tab_home,
      RoutePath.meetings => context.s.tab_meetings,
      RoutePath.news => context.s.tab_news,
      RoutePath.members => context.s.tab_members,
      _ => 'ERROR',
    };
  }

  void _onTabChanged(BuildContext context, int index) {
    return switch (index) {
      0 => const HomeRoute().go(context),
      1 => const MeetingsRoute().go(context),
      2 => const NewsRoute().go(context),
      3 => const MembersRoute().go(context),
      _ => null,
    };
  }

  String _getCurrentPath(BuildContext context) {
    return GoRouterState.of(context).uri.toString();
  }

  @override
  Widget build(BuildContext context) {
    final routePath = _getCurrentPath(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        if (maxWidth < 600) {
          return Scaffold(
            backgroundColor: context.colors.background,
            drawer: Drawer(
              width: 150,
              shape: const Border(),
              child: KMSidePanel(
                selectedIndex: RoutePath.tabs.indexWhere(
                  (path) => path == routePath,
                ),
                options: RoutePath.tabs.mapIndexed(
                  (index, path) => KMSidePanelOption(
                    label: _getLabelForRoutePath(context, path),
                    onTap: () {
                      Navigator.of(context).pop();
                      _onTabChanged(context, index);
                    },
                  ),
                ),
              ),
            ),
            appBar: AppBar(
              title: KMText(
                context.s.app_title,
              ),
              centerTitle: true,
              actions: const [
                BrightnessSwitch(),
                SizedBox(width: 4),
                LanguageSwitch(),
                SizedBox(width: 4),
              ],
            ),
            body: body,
          );
        }

        return Scaffold(
          backgroundColor: context.colors.background,
          appBar: AppBar(
            title: KMText(
              context.s.app_name,
            ),
            centerTitle: true,
            actions: const [
              BrightnessSwitch(),
              SizedBox(width: 8),
              LanguageSwitch(),
              SizedBox(width: 8),
            ],
          ),
          body: Row(
            children: [
              KMSidePanel(
                selectedIndex: RoutePath.tabs.indexWhere(
                  (path) => path == routePath,
                ),
                options: RoutePath.tabs
                    .mapIndexed(
                      (index, path) => KMSidePanelOption(
                        label: _getLabelForRoutePath(context, path),
                        onTap: () => _onTabChanged(context, index),
                      ),
                    )
                    .toList(),
              ),
              Expanded(child: body),
            ],
          ),
        );
      },
    );
  }
}
