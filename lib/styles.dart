import 'package:flutter/material.dart';

class Styles {
  static const whiteColor = Color.fromARGB(255, 255, 255, 255);
  static const primaryColor = Color.fromARGB(255, 253, 151, 48); // FD9730
  static const secondaryColor = Color.fromARGB(255, 42, 45, 62); // 2A2D3E
  static const tertiaryColor = Color.fromARGB(255, 123, 237, 255); // 7BEDFF
  static const bgColor = Color.fromARGB(255, 33, 35, 50); // 212332
  static const accentColor = Color.fromARGB(255, 242, 112, 5); // F27005

  static double defaultPaddingHor = 18.0;
  static double defaultPaddingVer = 18.0;
  static double defaultMarginHor = 18.0;
  static double defaultMarginVer = 16.0;
  static IconData iconEuro = Icons.euro;
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
