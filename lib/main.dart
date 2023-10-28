import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mutuo_mobile_app/globals.dart';
import 'package:mutuo_mobile_app/pages/de_calc_rata_anni_calc_page.dart';
import 'package:mutuo_mobile_app/pages/de_calc_rata_multi_tab.dart';
import 'package:mutuo_mobile_app/pages/de_calc_rata_rata_fissa_page.dart';
import 'package:mutuo_mobile_app/pages/de_calc_rata_rimborso_cap_page.dart';
import 'package:mutuo_mobile_app/pages/de_calc_rata_select_page.dart';
import 'package:mutuo_mobile_app/pages/de_calc_spese_multi_tab.dart';
import 'package:mutuo_mobile_app/pages/de_calc_spese_page.dart';
import 'package:mutuo_mobile_app/pages/de_select_graph_page.dart';
import 'package:mutuo_mobile_app/pages/de_select_page.dart';
import 'package:mutuo_mobile_app/pages/home_page.dart';
import 'package:mutuo_mobile_app/pages/it_calc_rata_anni_calc_page.dart';
import 'package:mutuo_mobile_app/pages/it_calc_rata_rata_fissa_page.dart';
import 'package:mutuo_mobile_app/pages/it_calc_rata_rimborso_cap_page.dart';
import 'package:mutuo_mobile_app/pages/it_calc_rata_select_page.dart';
import 'package:mutuo_mobile_app/pages/it_calc_spese_page.dart';
import 'package:mutuo_mobile_app/pages/it_select_graph_page.dart';
import 'package:mutuo_mobile_app/pages/it_select_page.dart';
import 'package:mutuo_mobile_app/pages/it_calc_rata_multi_tab.dart';
import 'package:mutuo_mobile_app/pages/splash_page.dart';
import 'package:mutuo_mobile_app/styles.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/it_calc_spese_multi_tab.dart';

// the net ninja tutorial playlist

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    String systemLocale = Intl.systemLocale;
    if (systemLocale == "it_IT") {
      appLanguage = "it";
    }
    else {
      appLanguage = "en";
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Styles.bgColor,
        textTheme:
            GoogleFonts.spaceGroteskTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white),
        canvasColor: Styles.secondaryColor,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashScreen(),
        "/home": (context) => const Home(),
        "/IT": (context) => ITSelectPage(language: appLanguage),
        "/DE": (context) => DESelectPage(language: appLanguage),
        // "/ITcalcRata": (context) => const ITCalcRataPage(),
        "/ITcalcRata": (context) => ITCalcRataSelectPage(language: appLanguage),
        "/ITcalcSpese": (context) => ITCalcSpesePage(language: appLanguage),
        "/ITcalcRataAnniCalc": (context) => ITCalcRataAnniCalcPage(language: appLanguage),
        "/ITcalcRataRataFissa": (context) => ITCalcRataRataFissaPage(language: appLanguage),
        "/ITcalcRataRimborsoCap": (context) =>
            ITCalcRataRimborsoCapPage(language: appLanguage),
        "/ITcalcRataTable": (context) => ITCalcRataMultiTabPage(language: appLanguage),
        "/ITcalcSpeseTable": (context) => ITCalcSpeseMultiTabPage(language: appLanguage),
        "/ITselGrafici": (context) => const ITSelectGraphPage(),
        "/DEcalcRata": (context) => DECalcRataSelectPage(language: appLanguage),
        "/DEcalcSpese": (context) => DECalcSpesePage(language: appLanguage),
        "/DEcalcRataAnniCalc": (context) => DECalcRataAnniCalcPage(language: appLanguage),
        "/DEcalcRataRataFissa": (context) => DECalcRataRataFissaPage(language: appLanguage),
        "/DEcalcRataRimborsoCap": (context) =>
            DECalcRataRimborsoCapPage(language: appLanguage),
        "/DEcalcRataTable": (context) => DECalcRataMultiTabPage(language: appLanguage),
        "/DEcalcSpeseTable": (context) => DECalcSpeseMultiTabPage(language: appLanguage),
        "/DEselGrafici": (context) => const DESelectGraphPage(),
      },
    );
  }
}
