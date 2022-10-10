import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/button_layout.dart';

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          ButtonGeneric(
            buttonlink: "ITcalcRata",
            buttonname: "Calcola Rata",
          ),
          ButtonGeneric(
            buttonlink: "ITcalcSpese",
            buttonname: "Calcola Spese",
          ),
        ],
      ),
    );
  }
}
