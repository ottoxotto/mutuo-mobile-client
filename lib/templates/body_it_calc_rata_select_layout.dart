import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/button_generic_layout.dart';


class ITBodyCalcRataSelectLayout extends StatefulWidget {
  final String language;

  const ITBodyCalcRataSelectLayout({Key? key, required this.language}) : super(key: key);

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
        children: <Widget>[
          ButtonGeneric(
            buttonlink: "ITcalcRataAnniCalc",
            buttonname: "BtnRataXAnni",
            buttonlogo: "house1",
            language: widget.language,
          ),
          ButtonGeneric(
            buttonlink: "ITcalcRataRataFissa",
            buttonname: "BtnRataFissa",
            buttonlogo: "payment1",
            language: widget.language,
          ),
          ButtonGeneric(
            buttonlink: "ITcalcRataRimborsoCap",
            buttonname: "BtnRimborsoCap",
            buttonlogo: "bars1",
            language: widget.language,
          ),
        ],
      ),
    );
  }
}
