import 'package:flutter/material.dart';

abstract class TransitionBuilders {
  static Widget fadeInOut(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      child: FadeTransition(
        opacity: Tween<double>(
          begin: 1,
          end: 0,
        ).animate(secondaryAnimation),
        child: child,
      ),
    );
  }
}
