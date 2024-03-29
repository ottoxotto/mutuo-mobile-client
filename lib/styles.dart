import 'package:flutter/material.dart';

class Styles {
  static const whiteColor = Color.fromARGB(255, 255, 255, 255);
  static const primaryColor = Color.fromARGB(255, 253, 151, 48); // FD9730
  static const secondaryColor = Color.fromARGB(255, 42, 45, 62); // 2A2D3E
  static const tertiaryColor = Color.fromARGB(255, 0, 221, 193); // 00DDC1
  static const bgColor = Color.fromARGB(255, 33, 35, 50); // 212332
  static const accentColor = Color.fromARGB(255, 242, 112, 5); // F27005
  static const goldColor = Color.fromARGB(255, 255, 220, 0); // #FFDC00
  static const disabled = Color.fromARGB(0, 32, 39, 46); // 00DDC1

  static double defaultPaddingHor = 18.0;
  static double defaultPaddingVer = 18.0;
  static double defaultMarginHor = 18.0;
  static double defaultMarginVer = 16.0;
  static double defaultRadius = 20;
  static BorderRadius defaultBorderRadius = BorderRadius.circular(20);

  static double defaultCellFontSmallSize = 15.0;
  static double defaultCellFontBigSize = 20.0;

  static ScrollbarThemeData scrollbarTheme =
      const ScrollbarThemeData().copyWith(
    thumbColor: MaterialStateProperty.all(Styles.accentColor),
    // thumbVisibility: true,
    interactive: true,
  );
}
