import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mutuo_mobile_app/templates/inputcombobox_layout.dart';
import 'package:mutuo_mobile_app/templates/inputrow_layout.dart';
import 'dart:convert';
import "package:mutuo_mobile_app/globals.dart";
import 'package:mutuo_mobile_app/templates/outputrow_layout.dart';

Function eq = const ListEquality().equals;

class ITBodyCalcSpeseLayout extends StatefulWidget {
  const ITBodyCalcSpeseLayout({Key? key}) : super(key: key);

  @override
  State<ITBodyCalcSpeseLayout> createState() => _ITBodyCalcSpeseLayoutState();
}

class _ITBodyCalcSpeseLayoutState extends State<ITBodyCalcSpeseLayout> {
  String entry = "";
  List<String> finalResponse = ["", "", ""];
  final _formkey = GlobalKey<FormState>();
  List<bool> formBool = [];
  // String initRegistro = "2";
  // String initCatastale = "50";
  // String initIpotecaria = "50";
  // String initIVA = "0";

  static final Map<String, String> httpHeaders = {
    HttpHeaders.contentTypeHeader: "application/json",
    "Connection": "Keep-Alive",
    "Keep-Alive": "timeout=5, max=1000"
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const InputCombobox(
              cellTitle: "Tipologia Acquisto",
              dropDownEntries: [
                'Prima Casa da Privato',
                'Seconda Casa da Privato',
                'Prima Casa da Costruttore',
                'Seconda Casa da Costruttore',
                'Seconda Casa di Lusso da Costruttore'
              ],
            ),
            InputRow(
              formKeyNumb: 0,
              cellTitle: "Prezzo Immobile",
              iconName: "euro1",
              initialText: '',
              formKeyName: formKeysITspese,
              valueType: 'euro',
            ),
            InputRow(
              formKeyNumb: 1,
              cellTitle: "Percentuale Mutuo",
              iconName: "percentage1",
              initialText: '',
              formKeyName: formKeysITspese,
              valueType: 'percentage',
            ),
            InputRow(
              formKeyNumb: 2,
              cellTitle: "Percentuale Agenzia",
              iconName: "percentage1",
              initialText: '',
              formKeyName: formKeysITspese,
              valueType: 'percentage',
            ),
            InputRow(
              formKeyNumb: 3,
              cellTitle: "Spese di Istruttoria",
              iconName: "payment1",
              initialText: "",
              formKeyName: formKeysITspese,
              valueType: 'percentage-euro',
            ),
            InputRow(
              formKeyNumb: 4,
              cellTitle: "Assicurazioni",
              iconName: "payment1",
              initialText: '',
              formKeyName: formKeysITspese,
              valueType: 'euro',
            ),
            InputRow(
              formKeyNumb: 5,
              cellTitle: "Spese di Perizia",
              iconName: "payment1",
              initialText: '',
              formKeyName: formKeysITspese,
              valueType: 'euro',
            ),
            const Divider(
              height: 50,
              thickness: 5,
              color: Colors.white,
            ),
            OutputRow(
              cellTitle: "Anticipo Mutuo",
              iconName: "anticipo2",
              cellValue: finalResponse[0],
              valueType: 'euro',
            ),
            OutputRow(
              cellTitle: "Spese Iniziali",
              iconName: "sack1",
              cellValue: finalResponse[1],
              valueType: 'euro',
            ),
            OutputRow(
              cellTitle: "Tot. Uscite Iniziali",
              iconName: "pig1",
              cellValue: finalResponse[2],
              valueType: 'euro',
            ),
            ElevatedButton(
              onPressed: () async {
                formBool = [];
                for (int i = 0; i < formKeysITspese.length; i++) {
                  formKeysITspese[i].currentState!.validate();
                  formBool.add(formKeysITspese[i].currentState!.validate());
                }
                if (eq(formBool, [true, true, true, true, true, true])) {
                  var url = "$baseurl/outSpese";

                  final response = await http.post(Uri.parse(url),
                      headers: httpHeaders, body: json.encode(userEntry));
                  final decoded =
                      json.decode(response.body) as Map<String, dynamic>;
                  dataTable = decoded;
                  setState(() {
                    finalResponse[0] =
                        decoded["AnticipoMutuo"]["0"].toStringAsFixed(0);
                    finalResponse[1] =
                        decoded["TotCosti"]["0"].toStringAsFixed(0);
                    finalResponse[2] =
                        decoded["SpesaTotIniziale"]["0"].toStringAsFixed(0);
                  });
                }
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(15),
              ),
              child: const Text(
                "Calcola",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
