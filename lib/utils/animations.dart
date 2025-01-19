import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppAnimations {
  static const Duration defaultDuration = Duration(milliseconds: 500);
  static const Duration staggeredDelay = Duration(milliseconds: 80);
  static final defaultCurve = Curves.easeOutCubic;

  static List<Effect> fadeSlideUp = [
    FadeEffect(
      duration: defaultDuration,
      curve: defaultCurve,
    ),
    SlideEffect(
      begin: const Offset(0, 20),
      end: const Offset(0, 0),
      duration: defaultDuration,
      curve: defaultCurve,
    ),
  ];

  static List<Effect> fadeIn = [
    FadeEffect(
      duration: defaultDuration,
      curve: defaultCurve,
    ),
  ];

  static List<Effect> scaleIn = [
    ScaleEffect(
      begin: const Offset(0.95, 0.95),
      end: const Offset(1, 1),
      duration: defaultDuration,
      curve: defaultCurve,
    ),
    FadeEffect(
      duration: defaultDuration,
      curve: defaultCurve,
    ),
  ];

  static List<Effect> slideInRight = [
    SlideEffect(
      begin: const Offset(-20, 0),
      end: const Offset(0, 0),
      duration: defaultDuration,
      curve: defaultCurve,
    ),
    FadeEffect(
      duration: defaultDuration,
      curve: defaultCurve,
    ),
  ];

  static List<Effect> bounceScale = [
    ScaleEffect(
      begin: const Offset(0.8, 0.8),
      end: const Offset(1, 1),
      duration: defaultDuration,
      curve: Curves.elasticOut,
    ),
    FadeEffect(
      duration: Duration(
          milliseconds: (defaultDuration.inMilliseconds * 0.7).round()),
      curve: defaultCurve,
    ),
  ];
}
