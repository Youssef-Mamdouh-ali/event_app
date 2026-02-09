import 'package:event_app/utils/appColors.dart';
import 'package:flutter/material.dart';
abstract class ThemeManager {
  //
  // ThemeData lightTheme = ThemeData(
  //   primaryColor: Colors.blue,
  //
  //   elevatedButtonTheme:
  //
  // );
  /// light mode
  static ThemeData getLightTheme() => ThemeData(
    useMaterial3: true,
    primaryColor: Appcolors.primaryColor,
    scaffoldBackgroundColor: Appcolors.scaffoldBgColorLight,
    colorScheme: ColorScheme.light(
      primary: Appcolors.primaryColor,
      onSurface: Appcolors.textMainColor,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Appcolors.primaryColor),
      bodyMedium: TextStyle(color: Appcolors.textMainColor),
    ),

  );
  /// dark mode
  static ThemeData getDarkTheme() => ThemeData(
    useMaterial3: true,
    primaryColor: Appcolors.primaryColor,
    scaffoldBackgroundColor: Appcolors.scaffoldBgColorDark,
    colorScheme: ColorScheme.dark(
      primary: Appcolors.primaryColor,
      onSurface: Colors.white,
      surface: Appcolors.scaffoldBgColorDark,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
  );
}