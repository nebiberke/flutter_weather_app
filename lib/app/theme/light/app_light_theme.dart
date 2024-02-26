import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/app/theme/app_theme.dart';
import 'package:weather_app/app/theme/colorscheme/app_color_scheme.dart';

final class AppLightTheme implements AppTheme {
  @override
  ThemeData get themeData => ThemeData(
        fontFamily: GoogleFonts.rubik().fontFamily,
        useMaterial3: true,
        colorScheme: AppColorScheme.lightColorScheme,
        typography: Typography.material2021(),
        scaffoldBackgroundColor: AppColorScheme.lightColorScheme.background,
        textTheme: textTheme,
      );

  @override
  TextTheme get textTheme => TextTheme(
        bodySmall: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),
        displayLarge: TextStyle(
          fontSize: 100.sp,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          fontSize: 70.sp,
          fontWeight: FontWeight.bold,
        ),
      );
}
