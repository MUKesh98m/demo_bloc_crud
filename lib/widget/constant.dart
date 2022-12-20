import 'package:flutter/material.dart';
import 'dart:math';

// getRandomColor() => Colors.primaries[Random().nextInt(Colors.primaries.length)];
getRandomColor() => [
      Colors.blueAccent,
      Colors.redAccent,
      Colors.greenAccent,
    ][Random().nextInt(3)];

class AppColors {
// COLORS
  static const backgroundColor = Colors.black;
  var buttonColor = Colors.red[400];
  static const borderColor = Colors.grey;
  static const White = Colors.white;
  static const black = Colors.black;
  static const Color MainHeading = Color(0xFFFFF0A6);
  static const Color MainHeading1 = Color(0xFF947E14);
  static const Color backGround = Color(0xFF001921);

  static const Color textFieldColor = Color(0xff534E3B);
  static const Color textColor = Color(0xff726D44);
  static const Color menubarButtonColor = Color(0xff534E3B);
  static const Color searchButtonColor = Color(0xff68654A);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color blueColor = Colors.blue;
  static const Color faqTextColor = Color(0xFFC1AC5E);
  static const Color checkOutTopBorderIndex = Color(0xFF565230);
  static const Color faqTextHeadingColor = Color(0xFFEDD686);
  static const Color PayTextColor = Color(0xFF7E794B);

  static const Color collectionCartBackgroundColor =
      Color.fromRGBO(42, 39, 30, 0.6);

  static const Color dropdownbuttoncolor = Color.fromRGBO(83, 78, 59, 0.4);
  static const Color continueBrowse = Color.fromRGBO(207, 195, 132, 0.7);
}
