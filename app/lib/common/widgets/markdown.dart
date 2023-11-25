// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:knam/common/theme/theme.dart';

class KMMarkdown extends StatelessWidget {
  const KMMarkdown(
    this.data, {
    super.key,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.colors.surface,
      ),
      child: SizedBox(
        width: double.infinity,
        child: MarkdownBody(
          data: data,
          onTapLink: (_, url, __) {
            js.context.callMethod(
              'open',
              [url],
            );
          },
        ),
      ),
    );
  }
}
