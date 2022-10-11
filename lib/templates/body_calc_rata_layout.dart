import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mutuo_mobile_app/templates/inputrow_layout.dart';
import 'package:mutuo_mobile_app/templates/outputrow_layout.dart';
import "package:mutuo_mobile_app/globals.dart";

class ITBodyCalcLayout extends StatefulWidget {
  const ITBodyCalcLayout({Key? key}) : super(key: key);

  @override
  State<ITBodyCalcLayout> createState() => _ITBodyCalcLayoutState();
}

class _ITBodyCalcLayoutState extends State<ITBodyCalcLayout> {
  String entry = "";
  String finalResponse = "";
  final _formkey = GlobalKey<FormState>();
  List<bool> formBool = [];

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
            const InputRow(
              formKeyNumb: 0,
              cellTitle: "Finanziamento",
              iconName: "026-euro-2",
            ),
            const InputRow(
              formKeyNumb: 1,
              cellTitle: "Tasso di Interesse",
              iconName: "015-interest-rate",
            ),
            const InputRow(
              formKeyNumb: 2,
              cellTitle: "Anni per Calcolo Mutuo",
              iconName: "016-calendar",
            ),
            const InputRow(
              formKeyNumb: 3,
              cellTitle: "Durata Anni Tasso Fisso",
              iconName: "017-time-is-money",
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
                for (int i = 0; i < formKeys.length; i++) {
                  formKeys[i].currentState!.validate();
                  formBool.add(formKeys[i].currentState!.validate());
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
