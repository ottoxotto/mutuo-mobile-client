import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/button_generic_layout.dart';

class DEBodySelectLayout extends StatefulWidget {
  final String language;

  const DEBodySelectLayout({Key? key, required this.language}) : super(key: key);

  @override
  State<DEBodySelectLayout> createState() => _DEBodySelectLayoutState();
}

class _DEBodySelectLayoutState extends State<DEBodySelectLayout> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ButtonGeneric(
            buttonlink: "DEcalcRata",
            buttonname: "BtnCalcolaRata",
            buttonlogo: "house1",
            language: widget.language,
          ),
          ButtonGeneric(
            buttonlink: "DEcalcSpese",
            buttonname: "BtnCalcolaSpese",
            buttonlogo: "payment1",
            language: widget.language,
          ),
          ButtonGeneric(
            buttonlink: "DEselGrafici",
            buttonname: "BtnGrafici",
            buttonlogo: "bars1",
            language: widget.language,
          ),
        ],
      ),
    );
  }
}
