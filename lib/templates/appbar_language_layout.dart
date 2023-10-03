import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/globals.dart';
import 'package:mutuo_mobile_app/styles.dart';

String pageTitle(pageName){
  Map<String, dynamic> labelTitles;
  if (appLanguage == "it"){
    labelTitles = labelTitlesIT;
  }
  else {
    labelTitles = labelTitlesEN;
  }
  if (pageName == "ITSelectPage"){
    return labelTitles["TitleSelectPageIT"];
  }
  else if (pageName == "DESelectPage"){
    return labelTitles["TitleSelectPageDE"];
  }
  else if (pageName == "ITCalcRataSelectPage" || pageName == "DECalcRataSelectPage"){
    return labelTitles["TitleCalcRataPage"];
  }
  else if (pageName == "ITCalcRataAnniCalcPage" || pageName == "DECalcRataAnniCalcPage"){
    return labelTitles["TitleCalcRataXAnniPage"];
  }
  else if (pageName == "ITCalcRataRataFissaPage" || pageName == "DECalcRataRataFissaPage"){
    return labelTitles["TitleCalcRataRataFissaPage"];
  }
  else if (pageName == "ITCalcRataRimborsoCapPage" || pageName == "DECalcRataRimborsoCapPage"){
    return labelTitles["TitleCalcRataRimbCapPage"];
  }
  else if (pageName == "ITCalcSpesePage" || pageName == "DECalcSpesePage"){
    return labelTitles["TitleCalcSpesePage"];
  }
  else {
    return "Default";
  }
}

class AppBarLanguageLayout extends StatefulWidget implements PreferredSizeWidget {
  final String pageName;
  final Function(String) onLanguageChanged;

  const AppBarLanguageLayout({
    Key? key,
    required this.pageName, required this.onLanguageChanged,
  }) : super(key: key);

  @override
  State<AppBarLanguageLayout> createState() => _AppBarLanguageLayoutState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _AppBarLanguageLayoutState extends State<AppBarLanguageLayout> {
  // String selectedLanguage = appLanguage;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const ImageIcon(
          AssetImage("assets/icons/png/back-arrow.png"),
          size: 20,
        ),
      ),
      backgroundColor: Styles.bgColor,
      title: Text(
        pageTitle(widget.pageName),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20.0,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      actions: [
        InkWell(
          onTap: () {
            setState(() {
              appLanguage = "it";
              pageTitle(widget.pageName);
              widget.onLanguageChanged(appLanguage); // Notify the parent widget
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 10, top: 18),
            child: Text(
              "IT",
              style: TextStyle(
                color: appLanguage == "it" ? Colors.white : Colors.grey,
                fontSize: Styles.defaultCellFontSmallSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              appLanguage = "en";
              pageTitle(widget.pageName);
              widget.onLanguageChanged(appLanguage); // Notify the parent widget
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 10, top: 18),
            child: Text(
              "EN",
              style: TextStyle(
                color: appLanguage == "en" ? Colors.white : Colors.grey,
                fontSize: Styles.defaultCellFontSmallSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }


  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
