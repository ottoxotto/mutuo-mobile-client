import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/styles.dart';
import 'package:mutuo_mobile_app/globals.dart';

class InputComboboxEntryUpdate extends StatefulWidget {
  final List<String> dropDownEntries;
  final String cellTitle;
  final Function(String) onEntrySelected; // Add this line

  const InputComboboxEntryUpdate({
    Key? key,
    required this.dropDownEntries,
    required this.cellTitle,
    required this.onEntrySelected, // Add this line
  }) : super(key: key);

  @override
  State<InputComboboxEntryUpdate> createState() => _InputComboboxState();
}

class _InputComboboxState extends State<InputComboboxEntryUpdate> {
  TextEditingController userInput = TextEditingController();
  // String selectedValue = " ";
  String selectedValue = ''; // Add this line

  @override
  void initState() {
    super.initState();
    userEntry[widget.cellTitle] = widget.dropDownEntries[0];
    selectedValue = widget.dropDownEntries[0];

    if (kDebugMode) {
      print("Init state: selectedValue = $selectedValue");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("Build InputCombobox: selectedValue = $selectedValue");
    }
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
                  value: selectedValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                      // userEntry[widget.cellTitle] = selectedValue;
                      widget.onEntrySelected(
                          selectedValue); // Call the callback function
                    });
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
