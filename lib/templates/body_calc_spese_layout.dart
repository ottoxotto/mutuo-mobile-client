import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/inputcombobox_layout.dart';
import 'package:mutuo_mobile_app/templates/inputrow_layout.dart';
import "package:mutuo_mobile_app/globals.dart";
import 'package:mutuo_mobile_app/templates/outputrow_layout.dart';

Function eq = const ListEquality().equals;

class ITBodyCalcSpeseLayout extends StatefulWidget {
  final List<String> finalResponse;
  final String language;

  const ITBodyCalcSpeseLayout({Key? key, required this.finalResponse, required this.language})
      : super(key: key);

  @override
  State<ITBodyCalcSpeseLayout> createState() => _ITBodyCalcSpeseLayoutState();
}

class _ITBodyCalcSpeseLayoutState extends State<ITBodyCalcSpeseLayout> {
  String entry = "";
  final _formkey = GlobalKey<FormState>();
  List<bool> formBool = [];
  String previousLanguage = ""; // Define previousLanguage here

  String checkReset(String language, String output) {
    if (language != previousLanguage) {
      previousLanguage = language; // Store the current language
      return ""; // Return an empty string to reset the cellValue
    } else {
      return output; // Use the existing cellValue
    }
  }
  // String initRegistro = "2";
  // String initCatastale = "50";
  // String initIpotecaria = "50";
  // String initIVA = "0";

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
            InputCombobox(
              cellTitle: "TipAcquisto",
              dropDownEntries: const [
                "PrimaPrivato",
                "SecondaPrivato",
                "PrimaCostruttore",
                "SecondaCostruttore",
                "SecondaLussoCostruttore"
              ],
              language: widget.language,
            ),
            InputRow(
              formKeyNumb: 0,
              cellTitle: "InputPrezzo",
              iconName: "euro1",
              initialText: '',
              formKeyName: formKeysITspese,
              valueType: 'euro',
              disableFlag: false,
              language: widget.language,
            ),
            InputRow(
              formKeyNumb: 1,
              cellTitle: "InputPercMutuo",
              iconName: "percentage1",
              initialText: '',
              formKeyName: formKeysITspese,
              valueType: 'percentage',
              disableFlag: false,
              language: widget.language,
            ),
            InputRow(
              formKeyNumb: 2,
              cellTitle: "InputPercAgenzia",
              iconName: "percentage1",
              initialText: '',
              formKeyName: formKeysITspese,
              valueType: 'percentage',
              disableFlag: false,
              language: widget.language,
            ),
            InputRow(
              formKeyNumb: 3,
              cellTitle: "InputIstruttoria",
              iconName: "payment1",
              initialText: "",
              formKeyName: formKeysITspese,
              valueType: 'percentage-euro',
              disableFlag: false,
              language: widget.language,
            ),
            InputRow(
              formKeyNumb: 4,
              cellTitle: "InputAssicurazioni",
              iconName: "payment1",
              initialText: '',
              formKeyName: formKeysITspese,
              valueType: 'euro',
              disableFlag: false,
              language: widget.language,
            ),
            InputRow(
              formKeyNumb: 5,
              cellTitle: "InputPerizia",
              iconName: "payment1",
              initialText: '',
              formKeyName: formKeysITspese,
              valueType: 'euro',
              disableFlag: false,
              language: widget.language,
            ),
            const Divider(
              height: 50,
              thickness: 5,
              color: Colors.white,
            ),
            OutputRow(
              cellTitle: "OutputAnticipo",
              iconName: "anticipo2",
              cellValue: checkReset(widget.language,widget.finalResponse[0]),
              valueType: 'euro',
              language: widget.language,
            ),
            OutputRow(
              cellTitle: "OutputSpese",
              iconName: "sack1",
              cellValue: checkReset(widget.language,widget.finalResponse[1]),
              valueType: 'euro',
              language: widget.language,
            ),
            OutputRow(
              cellTitle: "OutputUsciteTot",
              iconName: "pig1",
              cellValue: checkReset(widget.language,widget.finalResponse[2]),
              valueType: 'euro',
              language: widget.language,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 40),
            )
            // ElevatedButton(
            //   onPressed: () async {
            //     formBool = [];
            //     for (int i = 0; i < formKeysITspese.length; i++) {
            //       formKeysITspese[i].currentState!.validate();
            //       formBool.add(formKeysITspese[i].currentState!.validate());
            //     }
            //     if (eq(formBool, [true, true, true, true, true, true])) {
            //       var url = "$baseurl/outSpese";

            //       final response = await http.post(Uri.parse(url),
            //           headers: httpHeaders, body: json.encode(userEntry));
            //       final decoded =
            //           json.decode(response.body) as Map<String, dynamic>;
            //       dataTable = decoded;
            //       setState(() {
            //         finalResponse[0] =
            //             decoded[anticipoMutuoLbl]["0"].toStringAsFixed(0);
            //         finalResponse[1] =
            //             decoded[totCostiLbl]["0"].toStringAsFixed(0);
            //         finalResponse[2] =
            //             decoded[spesaTotInizialeLbl]["0"].toStringAsFixed(0);
            //       });
            //     }
            //   },
            //   style: ButtonStyle(
            //     elevation: MaterialStateProperty.all(15),
            //   ),
            //   child: const Text(
            //     "Calcola",
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
