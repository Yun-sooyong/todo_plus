import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final Widget child;
  final Color backgound;
  final Function()? onTap;
  const SquareTile(
      {super.key, required this.backgound, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.longestSide * 0.1,
        width: size.longestSide * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Colors.white30),
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}
