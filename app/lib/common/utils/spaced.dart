import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

extension SpacedWidgets on Iterable<Widget> {
  List<Widget> spacedWith(Widget spacer) => expand((item) sync* {
        yield spacer;
        yield item;
      }).skip(1).toList();

  List<Widget> spaced(double gap) =>
      spacedWith(SizedBox(width: gap, height: gap));

  List<Widget> addEverywhere(Widget widget) {
    return expandIndexed((index, item) sync* {
      if (index == 0) {
        yield widget;
      }
      yield item;
      yield widget;
    }).toList();
  }
}
