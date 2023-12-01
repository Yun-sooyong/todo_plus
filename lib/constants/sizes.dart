import 'package:flutter/material.dart';

class Sizes {
  static const s4 = 4.0;
  static const s8 = 8.0;
  static const s12 = 12.0;
  static const s16 = 16.0;
  static const s20 = 20.0;
  static const s24 = 24.0;
  static const s28 = 28.0;

  static const s10 = 10.0;
  static const s15 = 15.0;
  static const s30 = 30.0;

  // edgeInsets
  static const padding1015 =
      EdgeInsets.symmetric(vertical: s10, horizontal: s15);
  static const padding15 = EdgeInsets.all(s15);
  static const pVertical15 = EdgeInsets.symmetric(vertical: 15);
  static const pHorizon15 = EdgeInsets.symmetric(horizontal: 15);

  // border radius
  static var borderR = BorderRadius.circular(s12);
  static var borderLeft = const BorderRadius.only(
    topLeft: Radius.circular(30),
    bottomLeft: Radius.circular(30),
  );
}
