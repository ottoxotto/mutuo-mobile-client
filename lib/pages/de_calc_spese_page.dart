import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/globals.dart';
import 'package:mutuo_mobile_app/styles.dart';
import 'package:mutuo_mobile_app/templates/appbar_layout.dart';
import 'package:mutuo_mobile_app/templates/body_de_calc_spese_layout.dart';
import 'package:mutuo_mobile_app/templates/botnavbarnotch_layout.dart';

Function eq = const ListEquality().equals;

class DECalcSpesePage extends StatefulWidget {
  const DECalcSpesePage({Key? key}) : super(key: key);

  @override
  State<DECalcSpesePage> createState() => _DECalcSpesePageState();
}

class _DECalcSpesePageState extends State<DECalcSpesePage> {
  List<bool> formBool = [];
  List<String> finalResponse = [
    "",
    "",
    ""
  ]; //the problem is how to update the OutputRow widget when finalResponse updates

  static final Map<String, String> httpHeaders = {
    HttpHeaders.contentTypeHeader: "application/json",
    "Connection": "Keep-Alive",
    "Keep-Alive": "timeout=5, max=1000"
  };

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("Build: finalResponse = $finalResponse");
    }
    return Scaffold(
        // backgroundColor: Styles.scaffoldBackgroundColor,
        appBar: const AppBarLayout(title: "Calcola Spese in Germania"),
        body: DEBodyCalcSpeseLayout(finalResponse: finalResponse),
        floatingActionButton: SizedBox(
          height: 80.0,
          width: 80.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () async {
                formBool = [];
                for (int i = 0; i < formKeysDEspese.length; i++) {
                  formKeysDEspese[i].currentState!.validate();
                  formBool.add(formKeysDEspese[i].currentState!.validate());
                }
                if (eq(formBool, [true, true, true, true, true])) {
                  var url = "$baseurl/outSpeseDE";

                  final response = await http.post(Uri.parse(url),
                      headers: httpHeaders, body: json.encode(userEntry));
                  final decoded =
                      json.decode(response.body) as Map<String, dynamic>;
                  dataTable = decoded;
                  setState(() {
                    finalResponse[0] =
                        decoded["TotCosti"]["0"].toStringAsFixed(0);
                    DEBodyCalcSpeseLayout(finalResponse: finalResponse);
                  });
                }
                formBool.clear();
              },
              backgroundColor: Styles.secondaryColor,
              splashColor: Colors.white,
              child: ElevatedButton(
                onPressed: () async {
                  formBool = [];
                  for (int i = 0; i < formKeysDEspese.length; i++) {
                    formKeysDEspese[i].currentState!.validate();
                    formBool.add(formKeysDEspese[i].currentState!.validate());
                  }
                  if (eq(formBool, [true, true, true, true, true])) {
                    var url = "$baseurl/outSpeseDE";

                    final response = await http.post(Uri.parse(url),
                        headers: httpHeaders, body: json.encode(userEntry));
                    final decoded =
                        json.decode(response.body) as Map<String, dynamic>;
                    dataTable = decoded;
                    setState(() {
                      finalResponse[0] =
                          decoded["TotCosti"]["0"].toStringAsFixed(0);
                      DEBodyCalcSpeseLayout(finalResponse: finalResponse);
                    });
                  }
                  formBool.clear();
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(51, 51),
                    shape: const CircleBorder(),
                    padding: EdgeInsets.all(Styles.defaultPaddingHor * 0.1),
                    elevation: 50,
                    backgroundColor: Styles.accentColor,
                    foregroundColor: Styles.whiteColor,
                    shadowColor: Styles.bgColor),
                child: const Image(
                  image: AssetImage("assets/icons/png/math.png"),
                  width: 33,
                  height: 33,
                  color: Styles.whiteColor,
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: const BotNavBarNotchLayout());
  }
}
