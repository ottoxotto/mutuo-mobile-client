import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/styles.dart';
import 'package:mutuo_mobile_app/templates/tab_layout.dart';

import '../templates/appbar_layout.dart';

class ITCalcSpeseMultiTabPage extends StatefulWidget {
  const ITCalcSpeseMultiTabPage({Key? key}) : super(key: key);

  @override
  State<ITCalcSpeseMultiTabPage> createState() =>
      _ITCalcSpeseMultiTabPageState();
}

class _ITCalcSpeseMultiTabPageState extends State<ITCalcSpeseMultiTabPage> {
  int _selectedIndex = 0;
  int index = 0;
  String apicall = "outSpeseOverview";

  String _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 0) {
      apicall = "outSpeseOverview";
      // } else if (_selectedIndex == 1) {
      //   apicall = "outSpeseOverview";
      // } else if (_selectedIndex == 2) {
      //   apicall = "outMutuoAvgTot";
      // } else if (_selectedIndex == 3) {
      //   apicall = "outMutuoOverview";
    }
    return apicall;
  }

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarLayout(title: "Dettagli Costi Mutuo"),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Styles.bgColor,
        buttonBackgroundColor: Colors.white,
        // buttonBackgroundColor: Styles.scaffoldBackgroundColor,
        key: _bottomNavigationKey,
        items: const <Widget>[
          Icon(
            Icons.looks_one_outlined,
            color: Styles.bgColor,
            size: 30,
          ),
          // Icon(
          //   Icons.looks_two_outlined,
          //   color: Styles.bgColor,
          //   size: 30,
          // ),
          // Icon(
          //   Icons.looks_3_outlined,
          //   color: Styles.bgColor,
          //   size: 30,
          // ),
          // Icon(
          //   Icons.looks_4_outlined,
          //   color: Styles.bgColor,
          //   size: 30,
          // ),
        ],
        onTap: _onItemTapped,
      ),
      body: TabLayout(apicall: apicall),
    );
  }
}
