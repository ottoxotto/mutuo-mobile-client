import 'package:flutter/material.dart';

class Styles {
  static Color scaffoldBackgroundColor = Colors.white;
  static Color appBarColor = Colors.white;
  static Color boxColor = Colors.white;
  static Color? defaultDarkGreyColor = Colors.grey[900];
  static Color? defaultGreyColor = Colors.grey[600];
  static Color? defaultLightGreyColor = Colors.grey[200];
  static Color defaultYellowColor = const Color.fromARGB(181, 253, 216, 53);

  static const primaryColor = Color(0xFF2697FF);
  static const secondaryColor = Color(0xFF2A2D3E);
  static const bgColor = Color(0xFF212332);

  static double defaultPadding = 18.0;
  static IconData iconEuro = Icons.euro;
  static BorderRadius defaultBorderRadius = BorderRadius.circular(20);

  static double defaultCellFontSmallSize = 15.0;
  static double defaultCellFontBigSize = 20.0;

  static ScrollbarThemeData scrollbarTheme =
      const ScrollbarThemeData().copyWith(
    thumbColor: MaterialStateProperty.all(defaultYellowColor),
    // thumbVisibility: true,
    interactive: true,
  );
}
