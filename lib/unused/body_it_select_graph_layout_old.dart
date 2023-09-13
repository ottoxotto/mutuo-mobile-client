import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/button_api_layout.dart';

class ITBodySelectGraphLayout extends StatefulWidget {
  const ITBodySelectGraphLayout({Key? key}) : super(key: key);

  @override
  State<ITBodySelectGraphLayout> createState() =>
      _ITBodySelectGraphLayoutState();
}

class _ITBodySelectGraphLayoutState extends State<ITBodySelectGraphLayout> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ButtonApiLayout(
            buttonlink: "ITgrafici",
            buttonname: "House Price Index",
            buttonlogo: "house1",
            apicode: 'PRC_HPI_A',
          ),
          ButtonApiLayout(
            buttonlink: "ITgrafici",
            buttonname: "Inflation",
            buttonlogo: "payment1",
            apicode: 'PRC_HICP_MANR',
          ),
        ],
      ),
    );
  }
}
