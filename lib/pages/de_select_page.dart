import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/globals.dart';
import 'package:mutuo_mobile_app/templates/appbar_language_layout.dart';
import 'package:mutuo_mobile_app/templates/body_de_select_layout.dart';

class DESelectPage extends StatefulWidget {
  final String language;

  const DESelectPage({Key? key, required this.language}) : super(key: key);

  @override
  State<DESelectPage> createState() => _DESelectPageState();
}

class _DESelectPageState extends State<DESelectPage> {
  @override
  Widget build(BuildContext context) {
    String currentLanguage = appLanguage; // Initial language selection
    void handleLanguageChange(String newLanguage) {
      setState(() {
        currentLanguage = newLanguage;
      });
    }
    return Scaffold(
      // backgroundColor: Styles.scaffoldBackgroundColor,
      appBar: AppBarLanguageLayout(pageName: widget.runtimeType.toString(), onLanguageChanged: handleLanguageChange),
      body: DEBodySelectLayout(language: currentLanguage),
      // bottomNavigationBar: BotNavBarLayout()
    );
  }
}
