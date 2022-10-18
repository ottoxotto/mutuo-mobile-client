import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mutuo_mobile_app/templates/inputcombobox_layout.dart';
import 'dart:convert';
import 'package:mutuo_mobile_app/templates/inputrow_layout.dart';
import 'package:mutuo_mobile_app/templates/outputrow_layout.dart';
import "package:mutuo_mobile_app/globals.dart";

class ITBodyCalcSpeseOldLayout extends StatefulWidget {
  const ITBodyCalcSpeseOldLayout({Key? key}) : super(key: key);

  @override
  State<ITBodyCalcSpeseOldLayout> createState() =>
      _ITBodyCalcSpeseOldLayoutState();
}

class _ITBodyCalcSpeseOldLayoutState extends State<ITBodyCalcSpeseOldLayout> {
  String entry = "";
  String finalResponse = "";
  final _formkey = GlobalKey<FormState>();
  List<bool> formBool = [];
  String initRegistro = "2";
  String initCatastale = "50";
  String initIpotecaria = "50";
  String initIVA = "0";

  static final Map<String, String> httpHeaders = {
    HttpHeaders.contentTypeHeader: "application/json",
    "Connection": "Keep-Alive",
    "Keep-Alive": "timeout=5, max=1000"
  };

  void initializeText(dropdownValue) {
    switch (dropdownValue) {
      case "Prima Casa da Privato":
        initRegistro = "2";
        initCatastale = "50";
        initIpotecaria = "50";
        initIVA = "0";
        break;
      case "Seconda Casa da Privato":
        initRegistro = "9";
        initCatastale = "50";
        initIpotecaria = "50";
        initIVA = "0";
        break;
      case "Prima Casa da Costruttore":
        initRegistro = "200";
        initCatastale = "200";
        initIpotecaria = "200";
        initIVA = "4";
        break;
      case "Seconda Casa da Costruttore":
        initRegistro = "200";
        initCatastale = "200";
        initIpotecaria = "200";
        initIVA = "10";
        break;
      case "Casa di Lusso da Costruttore":
        initRegistro = "200";
        initCatastale = "200";
        initIpotecaria = "200";
        initIVA = "22";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const InputCombobox(
              cellTitle: "Tipologia Aquisto",
              dropDownEntries: [
                'Prima Casa da Privato',
                'Seconda Casa da Privato',
                'Prima Casa da Costruttore',
                'Seconda Casa da Costruttore',
                'Casa di Lusso da Costruttore'
              ],
            ),
            InputRow(
              formKeyNumb: 0,
              cellTitle: "Prezzo Immobile",
              iconName: "026-euro-2",
              initialText: '',
              formKeyName: formKeysITspese,
            ),
            InputRow(
              formKeyNumb: 1,
              cellTitle: "Percentuale Mutuo",
              iconName: "015-interest-rate",
              initialText: '',
              formKeyName: formKeysITspese,
            ),
            InputRow(
              formKeyNumb: 2,
              cellTitle: "Percentuale Agenzia",
              iconName: "015-interest-rate",
              initialText: '',
              formKeyName: formKeysITspese,
            ),
            InputRow(
              formKeyNumb: 3,
              cellTitle: "Spese di Istruttoria",
              iconName: "017-time-is-money",
              initialText: "",
              formKeyName: formKeysITspese,
            ),
            InputRow(
              formKeyNumb: 4,
              cellTitle: "Imposta Sostituitiva",
              iconName: "017-time-is-money",
              initialText: '',
              formKeyName: formKeysITspese,
            ),
            InputRow(
              formKeyNumb: 5,
              cellTitle: "Spese di Perizia",
              iconName: "026-euro-2",
              initialText: '',
              formKeyName: formKeysITspese,
            ),
            InputRow(
              formKeyNumb: 6,
              cellTitle: "Imposta di Registro",
              iconName: "015-interest-rate",
              initialText: initRegistro,
              formKeyName: formKeysITspese,
            ),
            InputRow(
              formKeyNumb: 7,
              cellTitle: "Imposta Catastale",
              iconName: "026-euro-2",
              initialText: initCatastale,
              formKeyName: formKeysITspese,
            ),
            InputRow(
              formKeyNumb: 8,
              cellTitle: "Imposta Ipotecaria",
              iconName: "026-euro-2",
              initialText: initIpotecaria,
              formKeyName: formKeysITspese,
            ),
            InputRow(
              formKeyNumb: 9,
              cellTitle: "IVA",
              iconName: "015-interest-rate",
              initialText: initIVA,
              formKeyName: formKeysITspese,
            ),
            const Divider(
              height: 50,
              thickness: 5,
              color: Colors.white,
            ),
            OutputRow(
              cellTitle: "Rata Mensile",
              iconName: "018-wallet",
              cellValue: finalResponse,
            ),
            ElevatedButton(
              onPressed: () async {
                for (int i = 0; i < formKeysITspese.length; i++) {
                  formKeysITspese[i].currentState!.validate();
                  formBool.add(formKeysITspese[i].currentState!.validate());
                }
                if (formBool == [true, true, true, true]) {
                  var url = "$baseurl/outMutuo";

                  final response = await http.post(Uri.parse(url),
                      headers: httpHeaders, body: json.encode(userEntry));
                  final decoded =
                      json.decode(response.body) as Map<String, dynamic>;
                  dataTable = decoded;
                  setState(() {
                    finalResponse = decoded["Rata €"]["1"].toStringAsFixed(2);
                  });
                }

                // if (formKeys[0].currentState!.validate()) {
                //   var url = "$baseurl/outMutuo";

                //   final response = await http.post(Uri.parse(url),
                //       headers: httpHeaders, body: json.encode(userEntry));
                //   final decoded =
                //       json.decode(response.body) as Map<String, dynamic>;
                //   dataTable = decoded;
                //   setState(() {
                //     finalResponse = decoded["Rata €"]["1"].toStringAsFixed(2);
                //   });
                // }
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
