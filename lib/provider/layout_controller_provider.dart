import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_plus/constants/breakpoints.dart';

final layoutProvider = ChangeNotifierProvider((ref) => LayoutController());

class LayoutController with ChangeNotifier {
  bool isTablet = false;

  void checkDevice(BuildContext context) {
    // context.size!.shortestSide < BreakPoint.tablet
    //     ? isTablet = false
    //     : isTablet = true;
    notifyListeners();
  }
}
