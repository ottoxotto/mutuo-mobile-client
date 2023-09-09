import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/button_generic_layout.dart';

class DEBodySelectLayout extends StatefulWidget {
  const DEBodySelectLayout({Key? key}) : super(key: key);

  @override
  State<DEBodySelectLayout> createState() => _DEBodySelectLayoutState();
}

class _DEBodySelectLayoutState extends State<DEBodySelectLayout> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          ButtonGeneric(
            buttonlink: "DEcalcRata",
            buttonname: "Calcola Rata",
            buttonlogo: "house1",
          ),
          ButtonGeneric(
            buttonlink: "DEcalcSpese",
            buttonname: "Calcola Spese",
            buttonlogo: "payment1",
          ),
          ButtonGeneric(
            buttonlink: "DEselGrafici",
            buttonname: "Grafici",
            buttonlogo: "bars1",
          ),
        ],
      ),
    );
  }
}
