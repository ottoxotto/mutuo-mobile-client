import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/button_generic_layout.dart';

class DEBodyCalcRataSelectLayout extends StatefulWidget {
  final String language;

  const DEBodyCalcRataSelectLayout({Key? key, required this.language}) : super(key: key);

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
        children: <Widget>[
          ButtonGeneric(
            buttonlink: "DEcalcRataAnniCalc",
            buttonname: "BtnRataXAnni",
            buttonlogo: "house1", 
            language: widget.language,
          ),
          ButtonGeneric(
            buttonlink: "DEcalcRataRataFissa",
            buttonname: "BtnRataFissa",
            buttonlogo: "payment1",
            language: widget.language,
          ),
          ButtonGeneric(
            buttonlink: "DEcalcRataRimborsoCap",
            buttonname: "BtnRimborsoCap",
            buttonlogo: "bars1",
            language: widget.language,
          ),
        ],
      ),
    );
  }
}
