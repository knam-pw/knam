import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:knam/common/theme/theme.dart';
import 'package:knam/common/utils/spaced.dart';
import 'package:knam/common/widgets/text.dart';

class KMSidePanel extends StatelessWidget {
  const KMSidePanel({
    super.key,
    required this.selectedIndex,
    required this.options,
  });

  final Iterable<KMSidePanelOption> options;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 150,
      color: context.colors.surface,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: options
            .mapIndexed(
              (index, option) => Material(
                color: index == selectedIndex
                    ? context.colors.primary
                    : context.colors.transparent,
                child: InkWell(
                  onTap: option.onTap,
                  hoverColor: context.colors.primary.withOpacity(0.5),
                  splashColor: context.colors.primary.withOpacity(0.5),
                  radius: 100,
                  child: Container(
                    width: 150,
                    height: 50,
                    alignment: Alignment.center,
                    child: KMText(
                      option.label,
                      color: index == selectedIndex
                          ? context.colors.onPrimary
                          : context.colors.text,
                    ),
                  ),
                ),
              ),
            )
            .addEverywhere(
              Divider(
                color: context.colors.text,
                thickness: 1,
                height: 1,
              ),
            ),
      ),
    );
  }
}

class KMSidePanelOption {
  KMSidePanelOption({
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;
}
