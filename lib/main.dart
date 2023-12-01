import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_plus/constants/breakpoints.dart';
import 'package:todo_plus/firebase_options.dart';
import 'package:todo_plus/screens/auth_screen.dart';
import 'package:todo_plus/themes/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase google Auth
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO+',
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.lightTheme,
      //home: const AuthScreen(),
      home: checkDeivceOrientation(context),
    );
  }

  Widget checkDeivceOrientation(BuildContext context) {
    bool isTablet =
        MediaQuery.of(context).size.shortestSide > 600 ? true : false;
//    print(MediaQuery.of(context).orientation.toString());
    if (isTablet) {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
      //print('tablet');
      BreakPoint.isTablet = true;
      return const AuthScreen();
    } else {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      //print('phone');
      BreakPoint.isTablet = false;
      return const AuthScreen();
    }
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([]);
    super.dispose();
  }
}
