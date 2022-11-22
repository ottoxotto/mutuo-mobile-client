import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mutuo_mobile_app/globals.dart';
import 'package:mutuo_mobile_app/styles.dart';
import 'package:mutuo_mobile_app/templates/appbar_layout.dart';
import 'package:mutuo_mobile_app/templates/body_calc_rata_layout.dart';
import 'package:mutuo_mobile_app/templates/botnavbarnotch_layout.dart';

Function eq = const ListEquality().equals;

class ITCalcRataPage extends StatefulWidget {
  const ITCalcRataPage({Key? key}) : super(key: key);

  @override
  State<ITCalcRataPage> createState() => _ITCalcRataPageState();
}

class _ITCalcRataPageState extends State<ITCalcRataPage> {
  List<bool> formBool = [];
  String finalResponse =
      ""; //the problem is how to update the OutputRow widget when finalResponse updates

  static final Map<String, String> httpHeaders = {
    HttpHeaders.contentTypeHeader: "application/json",
    "Connection": "Keep-Alive",
    "Keep-Alive": "timeout=5, max=1000"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Styles.scaffoldBackgroundColor,
        appBar: const AppBarLayout(title: "Calcola Rata in Italia"),
        body: ITBodyCalcRataLayout(finalResponse: finalResponse),
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

                  final response = await http.post(Uri.parse(url),
                      headers: httpHeaders, body: json.encode(userEntry));
                  final decoded =
                      json.decode(response.body) as Map<String, dynamic>;
                  dataTable = decoded;
                  setState(() {
                    finalResponse = decoded["Rata €"]["1"].toStringAsFixed(2);
                    ITBodyCalcRataLayout(finalResponse: finalResponse);
                  });
                }
                formBool.clear();
              },
              backgroundColor: Styles.accentColor,
              foregroundColor: Styles.whiteColor,
              splashColor: Colors.white,
              child: const ImageIcon(AssetImage("assets/icons/png/math.png"),
                  color: Colors.white, size: 36),
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: const [
              //     ImageIcon(AssetImage("assets/icons/png/math.png"),
              //         color: Colors.white, size: 26),
              //     Text(
              //       "Calcola",
              //       style: TextStyle(
              //         fontSize: 10,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //   ],
              // ),
            ), //icon inside button
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: const BotNavBarNotchLayout());
  }
}
