import 'package:flutter/material.dart';

class ResponsLayout extends StatelessWidget {
  final Widget phone;
  final Widget tablet;

  const ResponsLayout({super.key, required this.phone, required this.tablet});

  static const int phoneLimit = 650;
  static const int tabletLimit = 1100;

  static bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width < phoneLimit;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletLimit &&
      MediaQuery.of(context).size.width >= phoneLimit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < phoneLimit) {
          return phone;
        } else {
          return tablet;
        }
      },
    );
  }
}
