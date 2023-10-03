import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/globals.dart';
import 'package:mutuo_mobile_app/templates/appbar_language_layout.dart';
import 'package:mutuo_mobile_app/templates/body_it_select_layout.dart';

class ITSelectPage extends StatefulWidget {
  final String language;

  const ITSelectPage({Key? key, required this.language}) : super(key: key);

  @override
  State<ITSelectPage> createState() => _ITSelectPageState();
}

class _ITSelectPageState extends State<ITSelectPage> {
  String currentLanguage = appLanguage; // Initial language selection
  void handleLanguageChange(String newLanguage) {
    setState(() {
      currentLanguage = newLanguage;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Styles.scaffoldBackgroundColor,
      appBar: AppBarLanguageLayout(pageName: widget.runtimeType.toString(), onLanguageChanged: handleLanguageChange),
      body: ITBodySelectLayout(language: currentLanguage), // Pass the language to the child widget
      // bottomNavigationBar: BotNavBarLayout()
    );
  }
}
