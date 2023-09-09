import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/button_generic_layout.dart';

class DEBodyCalcRataSelectLayout extends StatefulWidget {
  const DEBodyCalcRataSelectLayout({Key? key}) : super(key: key);

  @override
  State<DEBodyCalcRataSelectLayout> createState() =>
      _DEBodyCalcRataSelectLayoutState();
}

class _DEBodyCalcRataSelectLayoutState
    extends State<DEBodyCalcRataSelectLayout> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          ButtonGeneric(
            buttonlink: "DEcalcRataAnniCalc",
            buttonname: "Calcola su X Anni",
            buttonlogo: "house1",
          ),
          ButtonGeneric(
            buttonlink: "DEcalcRataRataFissa",
            buttonname: "Fissa la Rata",
            buttonlogo: "payment1",
          ),
          ButtonGeneric(
            buttonlink: "DEcalcRataRimborsoCap",
            buttonname: "Fissa il Rimborso del Capitale",
            buttonlogo: "bars1",
          ),
        ],
      ),
    );
  }
}
