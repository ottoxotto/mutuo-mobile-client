import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/inputcombobox_entryupdate_layout.dart';
import 'package:mutuo_mobile_app/templates/inputrow_layout.dart';
import "package:mutuo_mobile_app/globals.dart";
import 'package:mutuo_mobile_app/templates/outputrow_layout.dart';

Function eq = const ListEquality().equals;

class DEBodyCalcSpeseLayout extends StatefulWidget {
  final List<String> finalResponse;
  final String language;


  const DEBodyCalcSpeseLayout({Key? key, required this.finalResponse, required this.language})
      : super(key: key);

  @override
  State<DEBodyCalcSpeseLayout> createState() => _DEBodyCalcSpeseLayoutState();
}

class _DEBodyCalcSpeseLayoutState extends State<DEBodyCalcSpeseLayout> {
  // ValueNotifier<String> aValueNotifier = ValueNotifier('');

  String entry = "Bayern";
  String grunderwerbsteuerValue = ""; // Add this line
  final _formkey = GlobalKey<FormState>();
  List<bool> formBool = [];

  String getInitialText() {
    // grunderwerbsteuerValue = getInitialTextForEntry(entry);
    if (kDebugMode) {
      print("Fun getInitialText: entry = $entry");
    }
    return getInitialTextForEntry(entry);
  }

  @override
  void initState() {
    super.initState();
    grunderwerbsteuerValue = getInitialTextForEntry(entry); // Set initial value
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("Build Body: grunderwerbsteuerValue = $grunderwerbsteuerValue");
    }
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            InputComboboxEntryUpdate(
              cellTitle: "Bundesland",
              dropDownEntries: const [
                'Bayern',
                'Baden-Wüttemberg',
                'Saarland',
                'Rheinland-Pfalz',
                'Hessen',
                'Thüringen',
                'Sachsen',
                'Sachsen-Anhalt',
                'Nordrhein-Westfalen',
                'Niedersachsen',
                'Berlin',
                'Brandenburg',
                'Hamburg',
                'Bremen',
                'Mecklenburg-Vorpommern',
                'Schleswig-Holstein',
              ],
              onEntrySelected: (selectedValue) {
                setState(() {
                  entry = selectedValue; // Update the entry value
                  grunderwerbsteuerValue = getInitialText(); // Update the value
                  if (kDebugMode) {
                    print(
                        "setState onEntrySelected: grunderwerbsteuerValue = $grunderwerbsteuerValue");
                  }
                });
              },
            ),
            InputRow(
              formKeyNumb: 0,
              cellTitle: "InputPrezzo",
              iconName: "euro1",
              initialText: '',
              formKeyName: formKeysDEspese,
              valueType: 'euro',
              disableFlag: false,
              language: widget.language,
            ),
            // OutputRow(
            //   cellTitle: "Grunderwerbsteuer",
            //   iconName: "percentage1",
            //   cellValue: grunderwerbsteuerValue,
            //   valueType: 'percentage',
            // ),
            InputRow(
              formKeyNumb: 1,
              cellTitle: "InputGrunderwerbsteuer",
              iconName: "percentage1",
              initialText: grunderwerbsteuerValue, // Use the value
              formKeyName: formKeysDEspese,
              valueType: 'percentage',
              disableFlag: false,
              language: widget.language,
            ),
            InputRow(
              formKeyNumb: 2,
              cellTitle: "InputGrundbuchkosten",
              iconName: "percentage1",
              initialText: '0.005',
              formKeyName: formKeysDEspese,
              valueType: 'percentage',
              disableFlag: true,
              language: widget.language,
            ),
            InputRow(
              formKeyNumb: 3,
              cellTitle: "InputNotarkosten",
              iconName: "percentage1",
              initialText: '0.015',
              formKeyName: formKeysDEspese,
              valueType: 'percentage',
              disableFlag: true,
              language: widget.language,
            ),
            InputRow(
              formKeyNumb: 4,
              cellTitle: "InputMaklergebühren",
              iconName: "percentage1",
              initialText: '',
              formKeyName: formKeysDEspese,
              valueType: 'percentage',
              disableFlag: false,
              language: widget.language,
            ),
            const Divider(
              height: 50,
              thickness: 5,
              color: Colors.white,
            ),
            OutputRow(
              cellTitle: "OutputUsciteTot",
              iconName: "pig1",
              cellValue: widget.finalResponse[0],
              valueType: 'euro',
              language: widget.language,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 40),
            )
          ],
        ),
      ),
    );
  }
}

String getInitialTextForEntry(String entry) {
  switch (entry) {
    case 'Bayern':
      return '0.035';
    case 'Baden-Wüttemberg':
      return '0.05';
    case 'Saarland':
      return '0.065';
    case 'Rheinland-Pfalz':
      return '0.05';
    case 'Hessen':
      return '0.06';
    case 'Thüringen':
      return '0.065';
    case 'Sachsen':
      return '0.035';
    case 'Nordrhein-Westfalen':
      return '0.065';
    case 'Sachsen-Anhalt':
      return '0.05';
    case 'Niedersachsen':
      return '0.05';
    case 'Bremen':
      return '0.05';
    case 'Berlin':
      return '0.06';
    case 'Brandenburg':
      return '0.065';
    case 'Hamburg':
      return '0.045';
    case 'Meclenburg-Vorpommern':
      return '0.06';
    case 'Schleswig-Holstein':
      return '0.065';
    default:
      return ''; // Default initial text
  }
}
