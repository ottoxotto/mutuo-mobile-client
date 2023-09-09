import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/styles.dart';
import 'package:mutuo_mobile_app/globals.dart';

final Map<String, String> httpHeaders = {
  HttpHeaders.contentTypeHeader: "application/json",
  "Connection": "Keep-Alive",
  "Keep-Alive": "timeout=5, max=1000"
};

String extAPI(String title) {
  String extAPIcode = "PRC_HPI_A";
  switch (title) {
    case "House price index":
      extAPIcode = "PRC_HPI_A";
      return extAPIcode;
    case "Inflation":
      extAPIcode = "PRC_HICP_MANR";
      return extAPIcode;
    case "House Ownership":
      extAPIcode = "ilc_lvho02";
      return extAPIcode;
    case "House Expenses":
      extAPIcode = "ILC_MDES05";
      return extAPIcode;
    case "Housing costs percent":
      extAPIcode = "ILC_MDED01";
      return extAPIcode;
    default:
      return extAPIcode;
  }
}

class InputComboboxApi extends StatefulWidget {
  final List<String> dropDownEntries;
  final String cellTitle;
  final Function(String) notifyParent;
  const InputComboboxApi({
    Key? key,
    required this.dropDownEntries,
    required this.cellTitle,
    required this.notifyParent,
  }) : super(key: key);

  @override
  State<InputComboboxApi> createState() => _InputComboboxApiState();
}

class _InputComboboxApiState extends State<InputComboboxApi> {
  TextEditingController userInput = TextEditingController();
  String selectedValue = " ";

  @override
  void initState() {
    super.initState();
    userEntry[widget.cellTitle] = extAPI(widget.dropDownEntries[0]);
    selectedValue = widget.dropDownEntries[0];
    // selectedValue = "Seleziona Grafico";
    callAPIchart("outGrafici");
  }

  Future<void> callAPIchart(apiName) async {
    // var url = "http://10.0.2.2:5000/$apiName";
    var url = "$baseurl/$apiName";
    final response = await http.post(Uri.parse(url),
        headers: httpHeaders, body: json.encode(userEntry));
    final decoded = json.decode(response.body) as Map<String, dynamic>;
    setState(() {
      dataTable.clear();
      dataTable.addAll(decoded);
    });
    widget.notifyParent(selectedValue);
  }

  void _onItemTapped(String newValue) {
    setState(() {
      selectedValue = newValue;
      userEntry[widget.cellTitle] = extAPI(newValue);
      // plotData = [];
    });

    callAPIchart("outGrafici");
    // widget.notifyParent(selectedValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(
          Styles.defaultMarginHor,
          Styles.defaultMarginVer / 2,
          Styles.defaultMarginHor,
          Styles.defaultMarginVer),
      decoration: BoxDecoration(
        borderRadius: Styles.defaultBorderRadius,
        color: Styles.secondaryColor,
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: Styles.defaultBorderRadius,
              // side: const BorderSide(color: Styles.accentColor, width: 2),
            )),
            padding: MaterialStateProperty.all(
                EdgeInsets.all(Styles.defaultPaddingHor)),
            elevation: MaterialStateProperty.all(15),
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => Styles.secondaryColor)),
        child: Row(
          children: <Widget>[
            Expanded(
              // flex: 2,
              child: Form(
                child: DropdownButtonFormField(
                  items: widget.dropDownEntries
                      .map<DropdownMenuItem<String>>((String selectedValue) {
                    return DropdownMenuItem<String>(
                      value: selectedValue,
                      child: Text(
                        selectedValue,
                        style: const TextStyle(fontSize: 14),
                      ),
                    );
                  }).toList(),
                  hint: const Text("Seleziona Grafico"),
                  value: selectedValue,
                  onChanged: (String? newValue) async {
                    _onItemTapped(newValue!);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Styles.accentColor, width: 3.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    fillColor: Colors.grey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
