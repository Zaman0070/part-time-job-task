import 'package:flutter/material.dart';

class MyColors {
  //common colors
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color red = Color(0xFFFF0000);
  static const Color bodyTextColor = Color(0xFF010247);
  static const Color grey = Color(0xFF939393);
  static const Color lightGrey = Color(0xFFC8C8CB);
  static const Color inputBorderColor = Color(0xffF0F2F1);
  static const Color primary = Color(0xFF9D00DE);
  static const Color cardColor = Color(0xFFFBF1FF);
  static const Color alphabets = Color(0xFFF0F0F0);

  //dark theme Colors
  static const Color darkThemeColor = Color(0xFF000000);
  static const Color darkTitleColor = Color(0xFFFFFFFF);
  static const Color darkTextColor = Color(0xFFFFFFFF);
  static const Color darkLightTextColor = Color(0xFF666666);
  static const Color darkContainerColor = Color(0xFF2C2C2C);
  static const Color darkButtonTextColor = Color(0xFF000000);

  //Bright theme Color
  static const Color lightThemeColor = Color(0xFFFFFFFF);
  static const Color lightTitleColor = Color(0xFF000000);
  static const Color lightTextColor = Color(0xFF000000);
  static const Color lightLightTextColor = Color(0xFF666666);
  static const Color lightGreyColor = Color(0xFFAAAAAA);
  static const Color lightContainerColor = Color(0xFFD9D9D9);
  static const Color lightButtonTextColor = Color(0xFFFFFFFF);

  //how to use colors
  // colorscheme.primary : for text and title
  // colorscheme.secondary : for light text
  // colorscheme.onPrimary : for text on buttons
  // colorscheme.primaryContainer : for containers like text-fields, barbers card ,checkout etc ...
  // colorscheme.secondaryContainer : for button colors
}
