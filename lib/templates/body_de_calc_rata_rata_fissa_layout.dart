import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:mutuo_mobile_app/templates/inputrow_layout.dart';
import "package:mutuo_mobile_app/globals.dart";

Function eq = const ListEquality().equals;

class DEBodyCalcRataRataFissaLayout extends StatefulWidget {
  final String finalResponse;
  final String language;

  const DEBodyCalcRataRataFissaLayout({Key? key, required this.finalResponse, required this.language})
      : super(key: key);

  @override
  State<DEBodyCalcRataRataFissaLayout> createState() =>
      _DEBodyCalcRataRataFissaLayoutState();
}

class _DEBodyCalcRataRataFissaLayoutState
    extends State<DEBodyCalcRataRataFissaLayout> {
  String entry = "";
  final _formkey = GlobalKey<FormState>();
  List<bool> formBool = [];

  // static final Map<String, String> httpHeaders = {
  //   HttpHeaders.contentTypeHeader: "application/json",
  //   "Connection": "Keep-Alive",
  //   "Keep-Alive": "timeout=5, max=1000"
  // };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            InputRow(
              formKeyNumb: 0,
              cellTitle: "InputFinanziamento",
              iconName: "euro1",
              initialText: '',
              formKeyName: formKeysDErata,
              valueType: 'euro',
              disableFlag: false,
              language: widget.language,
            ),
            InputRow(
              formKeyNumb: 1,
              cellTitle: "InputTasso",
              iconName: "percentage1",
              initialText: '',
              formKeyName: formKeysDErata,
              valueType: 'percentage',
              disableFlag: false,
              language: widget.language,
            ),
            InputRow(
              formKeyNumb: 2,
              cellTitle: "Rata",
              iconName: "calculator1",
              initialText: '',
              formKeyName: formKeysDErata,
              valueType: 'euro',
              disableFlag: false,
              language: widget.language,
            ),
            InputRow(
              formKeyNumb: 3,
              cellTitle: "InputAnniTassoFisso",
              iconName: "hourglass2",
              initialText: '',
              formKeyName: formKeysDErata,
              valueType: 'years',
              disableFlag: false,
              language: widget.language,
            ),
            InputRow(
              formKeyNumb: 4,
              cellTitle: "InputMaxiRata",
              iconName: "sack1",
              initialText: '',
              formKeyName: formKeysDErata,
              valueType: 'euro',
              disableFlag: false,
              language: widget.language,
            ),
            InputRow(
              formKeyNumb: 5,
              cellTitle: "InputMeseMaxiRata",
              iconName: "payment1",
              initialText: '',
              formKeyName: formKeysDErata,
              valueType: 'years',
              disableFlag: false,
              language: widget.language,
            ),
            // const Divider(
            //   height: 50,
            //   thickness: 5,
            //   color: Colors.white,
            // ),
            // OutputRow(
            //   cellTitle: "OutputRata",
            //   iconName: "wallet1",
            //   cellValue: widget.finalResponse,
            //   valueType: 'euro',
            // ),
          ],
        ),
      ),
    );
  }
}
