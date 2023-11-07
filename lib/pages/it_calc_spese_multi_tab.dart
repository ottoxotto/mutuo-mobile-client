import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/globals.dart';
import 'package:mutuo_mobile_app/styles.dart';
import 'package:mutuo_mobile_app/templates/appbar_table_layout.dart';
import 'package:mutuo_mobile_app/templates/tab_sticky_header_layout.dart';


String btnLabel(btnName, language){
  Map<String, dynamic> labelTitles;
  if (language == "it"){
    labelTitles = labelTitlesIT;
  }
  else {
    labelTitles = labelTitlesEN;
  }
  return labelTitles[btnName];
}

class ITCalcSpeseMultiTabPage extends StatefulWidget {
  final String language; // Add this parameter
  const ITCalcSpeseMultiTabPage({Key? key, required this.language}) : super(key: key);

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
  final ScrollController _tableController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTableLayout(title: btnLabel("TitleCalcSpesePage", widget.language), tableController: _tableController),
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
        ],
        onTap: _onItemTapped,
      ),
      body: TabStickyHeaderLayout(apicall: apicall, tableController: _tableController),
    );
  }
  @override
  void dispose() {
    // Dispose of the ScrollController to avoid memory leaks
    _tableController.dispose();
    super.dispose();
  }
}



          // Icon(
          //   Icons.looks_one_outlined,
          //   color: Styles.bgColor,
          //   size: 30,
          // ),