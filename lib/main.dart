import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/pages/home_page.dart';
import 'package:mutuo_mobile_app/pages/it_calc_rata_page.dart';
import 'package:mutuo_mobile_app/pages/it_select_page.dart';
import 'package:mutuo_mobile_app/pages/germania_page.dart';
import 'package:mutuo_mobile_app/pages/multi_tab_page2.dart';
import 'package:mutuo_mobile_app/styles.dart';
import 'package:google_fonts/google_fonts.dart';

// the net ninja tutorial playlist

void main() {
  runApp(
    const MyApp(
        //   initialRoute: "/home",
        //   routes: {
        //     "/home": (context) => const Home(),
        //     "/IT": (context) => const Italia(),
        //     "/DE": (context) => const Germania(),
        //   },
        ),
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
        textTheme: GoogleFonts.notoSansTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: Styles.secondaryColor,
      ),
      initialRoute: "/home",
      routes: {
        "/home": (context) => const Home(),
        "/IT": (context) => const Italia(),
        "/DE": (context) => const Germania(),
        "/ITcalcRata": (context) => const ITCalcRataPage(),
        "/ITcalcSpese": (context) => const ITCalcRataPage(),
        "/OVTable": (context) => const TabBarWindow2(),
        // "/OVTable1": (context) => const OverviewTab(),
      },
    );
  }
}
