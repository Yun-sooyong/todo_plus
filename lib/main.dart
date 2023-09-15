import 'package:flutter/material.dart';
import 'package:todo_plus/screens/layout.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:todo_plus/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeClass.lightTheme,
      dark: ThemeClass.darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (light, dark) => MaterialApp(
        title: 'Do & Doing & Done',
        debugShowCheckedModeBanner: false,
        theme: light,
        darkTheme: dark,
        home: const Layout(),
      ),
    );
  }
}
