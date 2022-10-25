import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mutuo_mobile_app/templates/inputcombobox_layout.dart';
import 'dart:convert';
import 'package:mutuo_mobile_app/templates/inputrow_layout.dart';
import 'package:mutuo_mobile_app/templates/outputrow_layout.dart';
import "package:mutuo_mobile_app/globals.dart";

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

  // void initializeText(dropdownValue) {
  //   switch (dropdownValue) {
  //     case "Prima Casa da Privato":
  //       initRegistro = "2";
  //       initCatastale = "50";
  //       initIpotecaria = "50";
  //       initIVA = "0";
  //       break;
  //     case "Seconda Casa da Privato":
  //       initRegistro = "9";
  //       initCatastale = "50";
  //       initIpotecaria = "50";
  //       initIVA = "0";
  //       break;
  //     case "Prima Casa da Costruttore":
  //       initRegistro = "200";
  //       initCatastale = "200";
  //       initIpotecaria = "200";
  //       initIVA = "4";
  //       break;
  //     case "Seconda Casa da Costruttore":
  //       initRegistro = "200";
  //       initCatastale = "200";
  //       initIpotecaria = "200";
  //       initIVA = "10";
  //       break;
  //     case "Casa di Lusso da Costruttore":
  //       initRegistro = "200";
  //       initCatastale = "200";
  //       initIpotecaria = "200";
  //       initIVA = "22";
  //       break;
  //   }
  // }

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
              cellTitle: "Assicurazioni",
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
            const Divider(
              height: 50,
              thickness: 5,
              color: Colors.white,
            ),
            OutputRow(
              cellTitle: "Anticipo Mutuo",
              iconName: "018-wallet",
              cellValue: finalResponse[0],
            ),
            OutputRow(
              cellTitle: "Spese Iniziali",
              iconName: "018-wallet",
              cellValue: finalResponse[1],
            ),
            OutputRow(
              cellTitle: "Tot. Uscite Iniziali",
              iconName: "018-wallet",
              cellValue: finalResponse[2],
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
                        decoded["AnticipoMutuo"]["1"].toStringAsFixed(0);
                    finalResponse[1] =
                        decoded["SpesaTotIniziale"]["1"].toStringAsFixed(0);
                    finalResponse[2] =
                        decoded["TotCosti"]["1"].toStringAsFixed(0);
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
