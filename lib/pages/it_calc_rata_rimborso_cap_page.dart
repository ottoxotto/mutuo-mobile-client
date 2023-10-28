import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mutuo_mobile_app/globals.dart';
import 'package:mutuo_mobile_app/styles.dart';
import 'package:mutuo_mobile_app/templates/appbar_language_layout.dart';
import 'package:mutuo_mobile_app/templates/botnavbarnotch_animated_layout.dart';

import '../templates/body_calc_rata_rimborso_cap_layout.dart';

Function eq = const ListEquality().equals;

class ITCalcRataRimborsoCapPage extends StatefulWidget {
  final String language;

  const ITCalcRataRimborsoCapPage({Key? key, required this.language}) : super(key: key);

  @override
  State<ITCalcRataRimborsoCapPage> createState() =>
      ITCalcRataRimborsoCapPageState();
}

class ITCalcRataRimborsoCapPageState extends State<ITCalcRataRimborsoCapPage> {
  List<bool> formBool = [];
  String finalResponse = ""; 
  bool blink = false;

  static final Map<String, String> httpHeaders = {
    HttpHeaders.contentTypeHeader: "application/json",
    "Connection": "Keep-Alive",
    "Keep-Alive": "timeout=5, max=1000"
  };

  @override
  Widget build(BuildContext context) {
    String currentLanguage = appLanguage; // Initial language selection
    String rataLbl;

    if (currentLanguage == "it"){
      rataLbl = "Rata €"; 
    } else {
      rataLbl = "Installment €";
    }
    void handleLanguageChange(String newLanguage) {
      setState(() {
        currentLanguage = newLanguage;
        userEntry = {};
        if (currentLanguage == "it"){
          rataLbl = "Rata €"; 
        } else {
          rataLbl = "Installment €";
    }
      });
    }
    return Scaffold(
        // backgroundColor: Styles.scaffoldBackgroundColor,
        appBar: AppBarLanguageLayout(pageName: widget.runtimeType.toString(), onLanguageChanged: handleLanguageChange),
        body: ITBodyCalcRataRimborsoCapLayout(finalResponse: finalResponse, language: currentLanguage),
        floatingActionButton: SizedBox(
          height: 80.0,
          width: 80.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () async {
                formBool = [];
                for (int i = 0; i < formKeysITrata.length; i++) {
                  formKeysITrata[i].currentState!.validate();
                  formBool.add(formKeysITrata[i].currentState!.validate());
                }

                if (eq(formBool, [true, true, true, true])) {
                  var url = "$baseurl/outMutuo";
                  userEntry["Language"] = currentLanguage;
                  final response = await http.post(Uri.parse(url),
                      headers: httpHeaders, body: json.encode(userEntry));
                  final decoded =
                      json.decode(response.body) as Map<String, dynamic>;
                  dataTable = decoded;
                  setState(() {
                    finalResponse = decoded[rataLbl]["1"].toStringAsFixed(2);
                    ITBodyCalcRataRimborsoCapLayout(finalResponse: finalResponse, language: currentLanguage);
                    blink = true;
                    BotNavBarNotchAnimatedLayout(flagBlink: blink);
                  });
                }
                formBool.clear();
              },
              backgroundColor: Styles.secondaryColor,
              splashColor: Colors.white,
              child: ElevatedButton(
                onPressed: () async {
                  formBool = [];
                  for (int i = 0; i < formKeysITrata.length; i++) {
                    formKeysITrata[i].currentState!.validate();
                    formBool.add(formKeysITrata[i].currentState!.validate());
                  }

                  if (eq(formBool, [true, true, true, true])) {
                    var url = "$baseurl/outMutuo";
                    userEntry["Language"] = currentLanguage;
                    final response = await http.post(Uri.parse(url),
                        headers: httpHeaders, body: json.encode(userEntry));
                    final decoded =
                        json.decode(response.body) as Map<String, dynamic>;
                    dataTable = decoded;
                    setState(() {
                      finalResponse = decoded[rataLbl]["1"].toStringAsFixed(2);
                      ITBodyCalcRataRimborsoCapLayout(finalResponse: finalResponse, language: currentLanguage);
                      blink = true;
                    });
                  }
                  formBool.clear();
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(50, 50),
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
                ), // <-- Text
              ),
            ), //icon inside button
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BotNavBarNotchAnimatedLayout(flagBlink: blink));
  }
}
