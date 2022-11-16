import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/styles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import "package:mutuo_mobile_app/globals.dart";

Future callApI(apiName) async {
  // var url = "http://10.0.2.2:5000/$apiName";
  var url = "$baseurl/$apiName";
  final response =
      await http.post(Uri.parse(url), body: json.encode(userEntry));
  final decoded = json.decode(response.body) as Map<String, dynamic>;
  dataTable = decoded;
}

class BotNavBarNotchLayout extends StatefulWidget {
  const BotNavBarNotchLayout({Key? key}) : super(key: key);

  @override
  State<BotNavBarNotchLayout> createState() => _BotNavBarNotchLayoutState();
}

class _BotNavBarNotchLayoutState extends State<BotNavBarNotchLayout> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 0) {
      Navigator.popUntil(context, ModalRoute.withName('/home'));
    } else if (_selectedIndex == 1) {
      if (ModalRoute.of(context)?.settings.name == "/ITcalcRata") {
        callApI("outMutuo");
        Navigator.pushNamed(context, "/ITcalcRataTable");
      } else if (ModalRoute.of(context)?.settings.name == "/ITcalcSpese") {
        callApI("outSpese");
        Navigator.pushNamed(context, "/ITcalcSpeseTable");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // borderRadius: Styles.defaultBorderRadius,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Styles.defaultRadius),
        topRight: Radius.circular(Styles.defaultRadius),
      ),
      child: BottomAppBar(
        //bottom navigation bar on scaffold
        color: Styles.whiteColor,
        shape: const CircularNotchedRectangle(), //shape of notch
        notchMargin:
            5, //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const ImageIcon(AssetImage("assets/icons/png/home.png"),
                  color: Styles.bgColor, size: 26),
              onPressed: () {
                _onItemTapped(0);
              },
            ),
            IconButton(
              icon: const ImageIcon(AssetImage("assets/icons/png/graph.png"),
                  color: Styles.bgColor, size: 26),
              onPressed: () {
                _onItemTapped(1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
