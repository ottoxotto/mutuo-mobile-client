import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/button_layout2.dart';

class ITBodySelectLayout extends StatefulWidget {
  const ITBodySelectLayout({Key? key}) : super(key: key);

  @override
  State<ITBodySelectLayout> createState() => _ITBodySelectLayoutState();
}

class _ITBodySelectLayoutState extends State<ITBodySelectLayout> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          // SizedBox(
          //   height: 400,
          //   // width: 400,
          //   child: Card(
          //     elevation: 4,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(32),
          //     ),
          //     color: Styles.secondaryColor,
          //     margin: EdgeInsets.fromLTRB(
          //         Styles.defaultMarginHor,
          //         Styles.defaultMarginVer / 2,
          //         Styles.defaultMarginHor,
          //         Styles.defaultMarginVer),
          //     child: Padding(
          //       padding: EdgeInsets.all(Styles.defaultPaddingHor),
          //       child: LineChartLayout(),
          //     ),
          //   ),
          // ),
          ButtonGeneric2(
            buttonlink: "ITcalcRata",
            buttonname: "Calcola Rata",
            buttonlogo: "house1",
          ),
          ButtonGeneric2(
            buttonlink: "ITcalcSpese",
            buttonname: "Calcola Spese",
            buttonlogo: "payment1",
          ),
          ButtonGeneric2(
            buttonlink: "ITgrafici",
            buttonname: "Grafici",
            buttonlogo: "bars1",
          ),
        ],
      ),
    );
  }
}
