import 'package:flutter/material.dart';
import 'package:todo_plus/layout_response.dart';

import 'phone_screens/project_screen_phone.dart';

/// splash 다음으로 실행, phone과 tablet 을 구분해서 화면을 제공 
/// 

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsLayout(
      phone: ProjectListScreen(
        isPhone: true,
      ),
      tablet: ProjectListScreen(
        isPhone: false,
      ),
    );
  }
}

/// TODO Theme toggle change  
/// TODO