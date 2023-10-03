import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/button_generic_layout.dart';

class ITBodySelectLayout extends StatefulWidget {
  final String language; 
  const ITBodySelectLayout({Key? key, required this.language}) : super(key: key);

  @override
  State<ITBodySelectLayout> createState() => _ITBodySelectLayoutState();
}

class _ITBodySelectLayoutState extends State<ITBodySelectLayout> {
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ButtonGeneric(
            buttonlink: "ITcalcRata",
            buttonname: "BtnCalcolaRata",
            buttonlogo: "house1",
            language: widget.language,
          ),
          ButtonGeneric(
            buttonlink: "ITcalcSpese",
            buttonname: "BtnCalcolaSpese",
            buttonlogo: "payment1",
            language: widget.language,
          ),
          ButtonGeneric(
            buttonlink: "ITselGrafici",
            buttonname: "BtnGrafici",
            buttonlogo: "bars1",
            language: widget.language,
          ),
        ],
      ),
    );
  }
}
