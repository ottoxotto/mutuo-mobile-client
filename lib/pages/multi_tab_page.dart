import 'package:flutter/material.dart';
import "package:mutuo_mobile_app/globals.dart";
import 'package:mutuo_mobile_app/styles.dart';
import 'package:mutuo_mobile_app/templates/tab_layout.dart';

// Future callApI(apiName) async {
//   var url = "http://10.0.2.2:5000/$apiName";
//   final response =
//       await http.post(Uri.parse(url), body: json.encode(userEntry));
//   final decoded = json.decode(response.body) as Map<String, dynamic>;
//   dataTable = decoded;
// }

class TabBarWindow extends StatefulWidget {
  const TabBarWindow({Key? key}) : super(key: key);

  @override
  State<TabBarWindow> createState() => _TabBarWindowState();
}

class _TabBarWindowState extends State<TabBarWindow> {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 4,
      child: Scaffold(
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
          bottom: TabBar(
            tabs: const [
              Tab(icon: Icon(Icons.looks_one_outlined)),
              Tab(icon: Icon(Icons.looks_two_outlined)),
              Tab(icon: Icon(Icons.looks_3_outlined)),
              Tab(icon: Icon(Icons.looks_4_outlined)),
            ],
            onTap: _onItemTapped,
          ),
        ),
        body: const TabBarView(
          children: [
            Tablayout(apititle: "outMutuo"),
            Tablayout(apititle: "outMutuoAvg"),
            Tablayout(apititle: "outMutuoAvgTot"),
            Tablayout(apititle: "outMutuoOverview"),
          ],
        ),
      ),
    ));
  }
}
