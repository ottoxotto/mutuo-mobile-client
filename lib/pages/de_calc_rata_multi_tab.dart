import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/styles.dart';
import 'package:mutuo_mobile_app/templates/tab_layout.dart';

import '../templates/appbar_layout.dart';

class DECalcRataMultiTabPage extends StatefulWidget {
  const DECalcRataMultiTabPage({Key? key}) : super(key: key);

  @override
  State<DECalcRataMultiTabPage> createState() => _DECalcRataMultiTabPageState();
}

class _DECalcRataMultiTabPageState extends State<DECalcRataMultiTabPage> {
  int _selectedIndex = 0;
  int index = 0;
  String apicall = "outMutuoDE";

  String _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 0) {
      apicall = "outMutuoDE";
    } else if (_selectedIndex == 1) {
      apicall = "outMutuoAvgDE";
    } else if (_selectedIndex == 2) {
      apicall = "outMutuoAvgTotDE";
    } else if (_selectedIndex == 3) {
      apicall = "outMutuoOverviewDE";
    }
    return apicall;
  }

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarLayout(title: "Piano di Ammortamento"),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        color: Styles.whiteColor,
        backgroundColor: Styles.secondaryColor,
        buttonBackgroundColor: Styles.whiteColor,
        // buttonBackgroundColor: Styles.scaffoldBackgroundColor,
        key: _bottomNavigationKey,
        items: const <Widget>[
          Image(
            image: AssetImage("assets/icons/png/num1.png"),
            width: 35,
            height: 35,
            // color: Styles.bgColor,
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
          ),
          Image(
            image: AssetImage("assets/icons/png/num2.png"),
            width: 35,
            height: 35,
            // color: Styles.bgColor,
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
          ),
          Image(
            image: AssetImage("assets/icons/png/num3.png"),
            width: 35,
            height: 35,
            // color: Styles.bgColor,
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
          ),
          Image(
            image: AssetImage("assets/icons/png/num4.png"),
            width: 35,
            height: 35,
            // color: Styles.bgColor,
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
          ),
        ],
        onTap: _onItemTapped,
      ),
      body: TabLayout(apicall: apicall),
    );
  }
}
