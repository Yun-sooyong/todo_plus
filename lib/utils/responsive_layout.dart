import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResponseLayout extends ConsumerWidget {
  final Widget mobileScreen;
  final Widget tabletScreen;
  const ResponseLayout(
      {super.key, required this.mobileScreen, required this.tabletScreen});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return MediaQuery.of(context).size.shortestSide > 600
            ? tabletScreen
            : mobileScreen;
      },
    );
  }
}
