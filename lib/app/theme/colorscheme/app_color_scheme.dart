import 'package:flutter/material.dart';

// Project custom color scheme
final class AppColorScheme {
  AppColorScheme._();

  // Light color scheme set
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFD1F6FF),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xff0B9EE5),
    onSecondary: Color(0xFF05234B),
    secondaryContainer: Color(0xff0472D1),
    tertiary: Color(0xFFFFC107),
    outline: Color(0xFFE0E0E0),
    surface: Color(0xFF1F1F1F),
    onSurface: Color(0xFFFFFFFF),
    background: Color(0xFFF8F8F8),
    onBackground: Color(0xFF000000),
    error: Color(0xFFD32F2F),
    onError: Color(0xFFFFFFFF),
  );

  // Dark color scheme set
  static const darkColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF1F1F1F),
    onPrimary: Color(0xFF29292B),
    secondary: Color(0xff0B9EE5),
    onSecondary: Color(0xff0B9EE5),
    secondaryContainer: Color(0xff0472D1),
    tertiary: Color(0xFFFFC107),
    outline: Color(0xFFE0E0E0),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF1F1F1F),
    background: Color(0xFF272727),
    onBackground: Color(0xFFFFFFFF),
    error: Color(0xFFD32F2F),
    onError: Color(0xFF000000),
  );
}
