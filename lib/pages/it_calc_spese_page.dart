import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/globals.dart';
import 'package:mutuo_mobile_app/styles.dart';
import 'package:mutuo_mobile_app/templates/appbar_layout.dart';
import 'package:mutuo_mobile_app/templates/body_calc_spese_layout.dart';
import 'package:mutuo_mobile_app/templates/botnavbarnotch_layout.dart';

Function eq = const ListEquality().equals;

class ITCalcSpesePage extends StatefulWidget {
  const ITCalcSpesePage({Key? key}) : super(key: key);

  @override
  State<ITCalcSpesePage> createState() => _ITCalcSpesePageState();
}

class _ITCalcSpesePageState extends State<ITCalcSpesePage> {
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
    return Scaffold(
        // backgroundColor: Styles.scaffoldBackgroundColor,
        appBar: const AppBarLayout(title: "Calcola Spese in Italia"),
        body: ITBodyCalcSpeseLayout(finalResponse: finalResponse),
        floatingActionButton: SizedBox(
          height: 80.0,
          width: 80.0,
          child: FittedBox(
            child: FloatingActionButton(
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
                    ITBodyCalcSpeseLayout(finalResponse: finalResponse);
                  });
                }
                formBool.clear();
              },
              backgroundColor: Styles.secondaryColor,
              splashColor: Colors.white,
              child: ElevatedButton(
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
                      ITBodyCalcSpeseLayout(finalResponse: finalResponse);
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


// ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                     shape: const CircleBorder(),
//                     padding: EdgeInsets.all(Styles.defaultPaddingHor * 0.1),
//                     elevation: 50,
//                     primary: Styles.accentColor,
//                     onPrimary: Styles.whiteColor,
//                     shadowColor: Styles.bgColor),
//                 child: const Image(
//                   image: AssetImage("assets/icons/png/calculate3.png"),
//                   width: 50,
//                   height: 50,
//                   color: null,
//                   fit: BoxFit.scaleDown,
//                   alignment: Alignment.center,
//                 ),
//               ),


// Material(
//                       color: Styles.accentColor,
//                       borderRadius: Styles.defaultBorderRadius,
//                       child: InkWell(
//                         splashColor: Styles.whiteColor,
//                         onTap: () {},
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: const <Widget>[
//                             Image(
//                               image:
//                                   AssetImage("assets/icons/png/calculate7.png"),
//                               width: 40,
//                               height: 40,
//                               color: null,
//                               fit: BoxFit.scaleDown,
//                               alignment: Alignment.topCenter,
//                             ),
//                             Text(
//                               "Calcola",
//                               style: TextStyle(
//                                 fontSize: 10,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ), // <-- Text
//                           ],
//                         ),
//                       ),
//                     ),