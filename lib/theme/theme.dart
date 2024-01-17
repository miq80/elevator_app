import 'package:flutter/material.dart';

class AppTheme {
  static const Color backgroundColor = Color(0xFFE6E6E6);
  static const Color borderColor = Color(0xFFF71111);
  static const Color dialogWindowColor = Color(0xFFD9D9D9);
  static const Color dialogWindowInputColor = Color(0xFFE7E6E6);
  static const Color lineColor = Color(0xFF000000);
}

class TextStyles {
  static const TextStyle textStyles16 = TextStyle(
      fontFamily: 'Inter',
      fontSize: 16,
      height: 19 / 16,
      fontWeight: FontWeight.w400,
      color: Colors.black);
  static const TextStyle textStyle24 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 24,
    height: 29 / 24,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle textStyle14 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    height: 16 / 14,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle textStyleDialogButton = TextStyle(
      fontFamily: 'Inter',
      fontSize: 14,
      height: 16 / 14,
      fontWeight: FontWeight.w400,
      color: Colors.black);
}
