import 'package:flutter/material.dart';

// Custom container theme for gradient cards
class GradientCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final LinearGradient? gradient;

  const GradientCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient ?? AppColors.cardGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: padding,
      child: child,
    );
  }
}

class AppColors {
  static const primary = Color(0xFF1E88E5);
  static const secondary = Color(0xFF1565C0);
  static const accent = Color(0xFF64B5F6);
  static const background = Color(0xFFF5F5F5);
  static const text = Color(0xFF212121);
  static const textLight = Color(0xFF757575);
  static const surface = Color(0xFFFFFFFF);
  static const error = Color(0xFFEF4444);
  static const success = Color(0xFF22C55E);

  // Gradient colors
  static const gradientStart = Color(0xFF1E88E5); // Primary blue
  static const gradientEnd = Color(0xFF1565C0); // Darker blue
  static const gradientAccent = Color(0xFF64B5F6); // Light blue

  // Modern card gradients
  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFF8FBFF),
    ],
  );

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradientStart, gradientEnd],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradientStart, gradientAccent],
  );
}

class AppTheme {
  static const double maxWidth = 1200.0;
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  static const Duration animationDuration = Duration(milliseconds: 300);
}
