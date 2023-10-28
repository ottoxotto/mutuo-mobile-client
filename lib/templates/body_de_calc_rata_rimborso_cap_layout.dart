
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:mutuo_mobile_app/templates/inputrow_layout.dart';
import "package:mutuo_mobile_app/globals.dart";
import 'package:mutuo_mobile_app/templates/outputrow_layout.dart';

Function eq = const ListEquality().equals;

class DEBodyCalcRataRimborsoCapLayout extends StatefulWidget {
  final String finalResponse;
  final String language;


  const DEBodyCalcRataRimborsoCapLayout({Key? key, required this.finalResponse, required this.language})
      : super(key: key);

  @override
  State<DEBodyCalcRataRimborsoCapLayout> createState() =>
      _DEBodyCalcRataRimborsoCapLayoutState();
}

class _DEBodyCalcRataRimborsoCapLayoutState
    extends State<DEBodyCalcRataRimborsoCapLayout> {
  String entry = "";
  final _formkey = GlobalKey<FormState>();
  List<bool> formBool = [];
  String selectedChoice = "Option 1";
  String previousLanguage = ""; // Define previousLanguage here

  String checkReset(String language, String output) {
    if (language != previousLanguage) {
      previousLanguage = language; // Store the current language
      return ""; // Return an empty string to reset the cellValue
    } else {
      return output; // Use the existing cellValue
    }
  }
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
            InputRow(
              formKeyNumb: 0,
              cellTitle: "InputFinanziamento",
              iconName: "euro1",
              initialText: '',
              formKeyName: formKeysDErata,
              valueType: 'euro',
              disableFlag: false,
              language: widget.language,
            ),
            InputRow(
              formKeyNumb: 1,
              cellTitle: "InputTasso",
              iconName: "percentage1",
              initialText: '',
              formKeyName: formKeysDErata,
              valueType: 'percentage',
              disableFlag: false,
              language: widget.language,
            ),
            InputRow(
              formKeyNumb: 2,
              cellTitle: "InputRimbCap",
              iconName: "calculator1",
              initialText: '',
              formKeyName: formKeysDErata,
              valueType: 'percentage',
              disableFlag: false,
              language: widget.language,
            ),
            InputRow(
              formKeyNumb: 3,
              cellTitle: "InputAnniTassoFisso",
              iconName: "hourglass2",
              initialText: '',
              formKeyName: formKeysDErata,
              valueType: 'years',
              disableFlag: false,
              language: widget.language,
            ),
            InputRow(
              formKeyNumb: 4,
              cellTitle: "InputMaxiRata",
              iconName: "sack1",
              initialText: '',
              formKeyName: formKeysDErata,
              valueType: 'euro',
              disableFlag: false,
              language: widget.language,
            ),
            InputRow(
              formKeyNumb: 5,
              cellTitle: "InputMeseMaxiRata",
              iconName: "payment1",
              initialText: '',
              formKeyName: formKeysDErata,
              valueType: 'years',
              disableFlag: false,
              language: widget.language,
            ),
            const Divider(
              height: 50,
              thickness: 5,
              color: Colors.white,
            ),
            OutputRow(
              cellTitle: "OutputRata",
              iconName: "wallet1",
              cellValue: checkReset(widget.language,widget.finalResponse),
              valueType: 'euro',
              language: widget.language,
            ),
            // ElevatedButton(
            //   onPressed: () async {
            //     formBool = [];
            //     for (int i = 0; i < formKeysDErata.length; i++) {
            //       formKeysDErata[i].currentState!.validate();
            //       formBool.add(formKeysDErata[i].currentState!.validate());
            //     }

            //     if (eq(formBool, [true, true, true, true])) {
            //       var url = "$baseurl/outMutuo";

            //       final response = await http.post(Uri.parse(url),
            //           headers: httpHeaders, body: json.encode(userEntry));
            //       final decoded =
            //           json.decode(response.body) as Map<String, dynamic>;
            //       dataTable = decoded;
            //       setState(() {
            //         widget.finalResponse =
            //             decoded[rataLbl]["1"].toStringAsFixed(2);
            //       });
            //     }
            //     formBool.clear();
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
