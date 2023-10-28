import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/globals.dart';
import 'package:mutuo_mobile_app/templates/appbar_language_layout.dart';

import '../templates/body_it_calc_rata_select_layout.dart';

class ITCalcRataSelectPage extends StatefulWidget {
  final String language;

  const ITCalcRataSelectPage({Key? key, required this.language}) : super(key: key);

  @override
  State<ITCalcRataSelectPage> createState() => _ITCalcRataSelectPageState();
}

class _ITCalcRataSelectPageState extends State<ITCalcRataSelectPage> {
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
      body: ITBodyCalcRataSelectLayout(language: currentLanguage),
      // bottomNavigationBar: BotNavBarLayout()
    );
  }
}
