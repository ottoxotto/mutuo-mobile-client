import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/button_generic_layout.dart';

class ITBodyCalcRataSelectLayout extends StatefulWidget {
  const ITBodyCalcRataSelectLayout({Key? key}) : super(key: key);

  @override
  State<ITBodyCalcRataSelectLayout> createState() =>
      _ITBodyCalcRataSelectLayoutState();
}

class _ITBodyCalcRataSelectLayoutState
    extends State<ITBodyCalcRataSelectLayout> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          ButtonGeneric(
            buttonlink: "ITcalcRataAnniCalc",
            buttonname: "Calcola su X Anni",
            buttonlogo: "house1",
          ),
          ButtonGeneric(
            buttonlink: "ITcalcRataRataFissa",
            buttonname: "Fissa la Rata",
            buttonlogo: "payment1",
          ),
          ButtonGeneric(
            buttonlink: "ITcalcRataRimborsoCap",
            buttonname: "Fissa il Rimborso del Capitale",
            buttonlogo: "bars1",
          ),
        ],
      ),
    );
  }
}
