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

class BotNavBarLayout extends StatefulWidget {
  const BotNavBarLayout({Key? key}) : super(key: key);

  @override
  State<BotNavBarLayout> createState() => _BotNavBarLayoutState();
}

class _BotNavBarLayoutState extends State<BotNavBarLayout> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 0) {
      Navigator.popUntil(context, ModalRoute.withName('/home'));
    } else if (_selectedIndex == 1) {
      callApI("outMutuo");
      Navigator.pushNamed(context, "/OVTable");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Styles.defaultDarkGreyColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          tooltip: 'Home',
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            Icons.table_view,
            color: Colors.white,
          ),
          tooltip: 'Piano di Ammortamento',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
