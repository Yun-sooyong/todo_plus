import 'package:flutter/material.dart';
import 'package:todo_plus/constants/colors.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colorz.cMain,
    appBarTheme: appBarTheme(),
    iconTheme: const IconThemeData(
      color: Colorz.cMainLight,
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: 16,
        color: Colorz.cMainLight,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colorz.cMain,
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: const Color(0xFF480032),
    ),
  );
}

AppBarTheme appBarTheme() => const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      color: Colors.transparent,
      titleTextStyle: TextStyle(
        color: Colorz.cMainLight,
        fontWeight: FontWeight.w500,
        fontSize: 24,
      ),
    );
