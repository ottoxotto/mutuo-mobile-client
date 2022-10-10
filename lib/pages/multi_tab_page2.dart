import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import "package:mutuo_mobile_app/globals.dart";
import 'package:mutuo_mobile_app/styles.dart';
import 'package:mutuo_mobile_app/templates/tab_layout2.dart';

class TabBarWindow2 extends StatefulWidget {
  const TabBarWindow2({Key? key}) : super(key: key);

  @override
  State<TabBarWindow2> createState() => _TabBarWindow2State();
}

class _TabBarWindow2State extends State<TabBarWindow2> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 0) {
      apicall = "outMutuo";
    } else if (_selectedIndex == 1) {
      apicall = "outMutuoAvg";
    } else if (_selectedIndex == 2) {
      apicall = "outMutuoAvgTot";
    } else if (_selectedIndex == 3) {
      apicall = "outMutuoOverview";
    }
  }

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/home");
          },
          icon: const Icon(Icons.home_rounded),
          color: Colors.white,
        ),
        backgroundColor: Styles.bgColor,
        title: const Text(
          "Piano di Ammortamento",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
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
          Icon(
            Icons.looks_two_outlined,
            color: Styles.bgColor,
            size: 30,
          ),
          Icon(
            Icons.looks_3_outlined,
            color: Styles.bgColor,
            size: 30,
          ),
          Icon(
            Icons.looks_4_outlined,
            color: Styles.bgColor,
            size: 30,
          ),
        ],
        onTap: _onItemTapped,
      ),
      body: Tablayout2(apicall),
    );
  }
}
