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

  static final Map<String, String> httpHeaders = {
    HttpHeaders.contentTypeHeader: "application/json",
    "Connection": "Keep-Alive",
    "Keep-Alive": "timeout=5, max=1000"
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const InputRow(
            cellTitle: "Finanziamento",
            // iconName: Icons.euro_symbol,
            iconName: "026-euro-2",
          ),
          const InputRow(
            cellTitle: "Tasso di Interesse",
            // iconName: Icons.percent,
            iconName: "015-interest-rate",
          ),
          const InputRow(
            cellTitle: "Anni per Calcolo Mutuo",
            // iconName: Icons.access_time,
            iconName: "016-calendar",
          ),
          const InputRow(
            cellTitle: "Durata Anni Tasso Fisso",
            // iconName: Icons.access_time_filled,
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
              // const url = "http://10.0.2.2:5000/outMutuo";
              var url = "$baseurl/outMutuo";

              final response = await http.post(Uri.parse(url),
                  headers: httpHeaders, body: json.encode(userEntry));
              final decoded =
                  json.decode(response.body) as Map<String, dynamic>;
              dataTable = decoded;
              setState(() {
                finalResponse = decoded["Rata €"]["1"].toStringAsFixed(2);
              });
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
    );
  }
}
