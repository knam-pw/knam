import 'package:flutter/material.dart';
import 'package:knam/common/theme/theme.dart';

class KMCard extends StatelessWidget {
  const KMCard({
    super.key,
    required this.header,
    required this.body,
  });

  final Widget header;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.colors.surface,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header,
          const SizedBox(height: 8),
          body,
        ],
      ),
    );
  }
}
