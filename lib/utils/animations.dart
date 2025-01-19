import 'dart:ui';

import 'package:flutter_animate/flutter_animate.dart';

class AppAnimations {
  static const Duration defaultDuration = Duration(milliseconds: 600);
  static const Duration staggeredDelay = Duration(milliseconds: 100);

  static List<Effect> fadeSlideUp = [
    const FadeEffect(duration: defaultDuration),
    const SlideEffect(
      begin: Offset(0, 30),
      end: Offset(0, 0),
      duration: defaultDuration,
    ),
  ];

  static List<Effect> fadeIn = [
    const FadeEffect(duration: defaultDuration),
  ];

  static List<Effect> scaleIn = [
    const ScaleEffect(
      begin: Offset(0.9, 0.9),
      end: Offset(1, 1),
      duration: defaultDuration,
    ),
    const FadeEffect(duration: defaultDuration),
  ];
}
