import 'package:flutter/material.dart';
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
      initialRoute: "/home",
      routes: {
        "/home": (context) => const Home(),
        "/IT": (context) => const ITSelectPage(),
        "/DE": (context) => const DESelectPage(),
        // "/ITcalcRata": (context) => const ITCalcRataPage(),
        "/ITcalcRata": (context) => const ITCalcRataSelectPage(),
        "/ITcalcSpese": (context) => const ITCalcSpesePage(),
        "/ITcalcRataAnniCalc": (context) => const ITCalcRataAnniCalcPage(),
        "/ITcalcRataRataFissa": (context) => const ITCalcRataRataFissaPage(),
        "/ITcalcRataRimborsoCap": (context) =>
            const ITCalcRataRimborsoCapPage(),
        "/ITcalcRataTable": (context) => const ITCalcRataMultiTabPage(),
        "/ITcalcSpeseTable": (context) => const ITCalcSpeseMultiTabPage(),
        "/ITselGrafici": (context) => const ITSelectGraphPage(),
        "/DEcalcRata": (context) => const DECalcRataSelectPage(),
        "/DEcalcSpese": (context) => const DECalcSpesePage(),
        "/DEcalcRataAnniCalc": (context) => const DECalcRataAnniCalcPage(),
        "/DEcalcRataRataFissa": (context) => const DECalcRataRataFissaPage(),
        "/DEcalcRataRimborsoCap": (context) =>
            const DECalcRataRimborsoCapPage(),
        "/DEcalcRataTable": (context) => const DECalcRataMultiTabPage(),
        "/DEcalcSpeseTable": (context) => const DECalcSpeseMultiTabPage(),
        "/DEselGrafici": (context) => const DESelectGraphPage(),
      },
    );
  }
}
