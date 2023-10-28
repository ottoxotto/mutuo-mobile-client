import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/globals.dart';
import 'package:mutuo_mobile_app/templates/appbar_language_layout.dart';

import 'package:mutuo_mobile_app/templates/body_de_calc_rata_select_layout.dart';

class DECalcRataSelectPage extends StatefulWidget {
  final String language;

  const DECalcRataSelectPage({Key? key, required this.language}) : super(key: key);

  @override
  State<DECalcRataSelectPage> createState() => _DECalcRataSelectPageState();
}

class _DECalcRataSelectPageState extends State<DECalcRataSelectPage> {
  @override
  Widget build(BuildContext context) {
    String currentLanguage = appLanguage; // Initial language selection
    void handleLanguageChange(String newLanguage) {
      setState(() {
        currentLanguage = newLanguage;
        userEntry = {};
      });
    }
    return Scaffold(
      // backgroundColor: Styles.scaffoldBackgroundColor,
      appBar: AppBarLanguageLayout(pageName: widget.runtimeType.toString(), onLanguageChanged: handleLanguageChange),
      body: DEBodyCalcRataSelectLayout(language: currentLanguage),
      // bottomNavigationBar: BotNavBarLayout()
    );
  }
}
