import 'dart:ui';
import 'package:flutter/material.dart';

class MyStyles {
  static const Color purple = Color(0xFF592D8C);
  static const Color orange = Color(0xFFF58000);
  static const Color breadcrumbPurple = Color(0xFFB5A0CA);
  static const TextStyle h1_black =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w400);
  static const TextStyle h1 = TextStyle(
    color: purple,
    fontSize: 30,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle h2 = TextStyle(
    color: purple,
    fontSize: 25,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle h3 = TextStyle(
    color: purple,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle h3_black = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle h4 = TextStyle(
    color: purple,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle h4_black = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle h4_orange = TextStyle(
    color: orange,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle price = TextStyle(
      color: Color(0xFF686868), fontSize: 11, fontWeight: FontWeight.w500);

  static const TextStyle messageStyle =
      TextStyle(fontSize: 25, fontWeight: FontWeight.w400);

  static const TextStyle p = TextStyle(fontSize: 12);

  static const TextStyle subtitle = TextStyle(fontSize: 12, fontWeight: FontWeight.w500);

  static const TextStyle fieldStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500);

  static const TextStyle hintText = TextStyle(color: Color(0xFF9E9E9E));

  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF592D8C),
    minimumSize: const Size(120, 50),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    // background
  );

  static ButtonStyle smallButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF592D8C),
    minimumSize: const Size(80, 15),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    // background
  );

  static const TextStyle breadcrumb = TextStyle(color: breadcrumbPurple, fontSize: 15, fontWeight: FontWeight.w600);
}
