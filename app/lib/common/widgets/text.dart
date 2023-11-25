import 'package:flutter/material.dart';

import 'package:knam/common/theme/colors.dart';
import 'package:knam/common/theme/theme.dart';

class KMText extends StatelessWidget {
  const KMText(
    this.data, {
    super.key,
    this.selectable = false,
    this.color,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.letterSpacing,
  });

  final String data;
  final bool selectable;
  final KMColor? color;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    final style = this.style ?? DefaultTextStyle.of(context).style;
    final color = this.color ?? context.colors.text;

    if (selectable) {
      return SelectableText(
        data,
        textAlign: textAlign,
        style: style.copyWith(
          color: color,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
        ),
        maxLines: maxLines,
      );
    }

    return Text(
      data,
      textAlign: textAlign,
      style: style.copyWith(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      ),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
