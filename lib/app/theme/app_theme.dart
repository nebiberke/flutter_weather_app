import 'package:flutter/material.dart';

abstract class AppTheme {
  ThemeData get themeData;

  TextTheme get textTheme => themeData.textTheme;
}
