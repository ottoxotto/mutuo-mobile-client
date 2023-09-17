import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:mutuo_mobile_app/templates/inputrow_layout.dart';
import "package:mutuo_mobile_app/globals.dart";

Function eq = const ListEquality().equals;

class DEBodyCalcRataRataFissaLayout extends StatefulWidget {
  final String finalResponse;

  const DEBodyCalcRataRataFissaLayout({Key? key, required this.finalResponse})
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
              cellTitle: "Finanziamento",
              iconName: "euro1",
              initialText: '',
              formKeyName: formKeysDErata,
              valueType: 'euro',
              disableFlag: false,
            ),
            InputRow(
              formKeyNumb: 1,
              cellTitle: "Tasso di Interesse",
              iconName: "percentage1",
              initialText: '',
              formKeyName: formKeysDErata,
              valueType: 'percentage',
              disableFlag: false,
            ),
            InputRow(
              formKeyNumb: 2,
              cellTitle: "Rata",
              iconName: "calculator1",
              initialText: '',
              formKeyName: formKeysDErata,
              valueType: 'euro',
              disableFlag: false,
            ),
            InputRow(
              formKeyNumb: 3,
              cellTitle: "Durata Anni Tasso Fisso",
              iconName: "hourglass2",
              initialText: '',
              formKeyName: formKeysDErata,
              valueType: 'years',
              disableFlag: false,
            ),
            InputRow(
              formKeyNumb: 4,
              cellTitle: "Maxi-Rata Annuale",
              iconName: "sack1",
              initialText: '',
              formKeyName: formKeysDErata,
              valueType: 'euro',
              disableFlag: false,
            ),
            InputRow(
              formKeyNumb: 5,
              cellTitle: "N° Mensilitá prima della Maxi-Rata",
              iconName: "payment1",
              initialText: '',
              formKeyName: formKeysDErata,
              valueType: 'years',
              disableFlag: false,
            ),
            // const Divider(
            //   height: 50,
            //   thickness: 5,
            //   color: Colors.white,
            // ),
            // OutputRow(
            //   cellTitle: "Rata Mensile",
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
