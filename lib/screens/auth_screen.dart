import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_plus/screens/login_screen.dart';
import 'package:todo_plus/screens/mobile/mobile_screen.dart';
import 'package:todo_plus/screens/mobile/project_list_screen.dart';
import 'package:todo_plus/utils/responsive_layout.dart';
import 'package:todo_plus/screens/tablet/tablet_project_notes.dart';
import 'package:todo_plus/services/data_service.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is login
          if (snapshot.hasData) {
            DataService.userUid = FirebaseAuth.instance.currentUser!.uid;
            //return const ViewProjectsScreen();
            return const ResponseLayout(
              mobileScreen: MobileScreen(),
              tabletScreen: TabletScreen(),
            );
          }
          // not login
          else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
