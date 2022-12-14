import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/styles.dart';
import 'package:mutuo_mobile_app/globals.dart';

class InputCombobox extends StatefulWidget {
  final List<String> dropDownEntries;
  final String cellTitle;
  const InputCombobox({
    Key? key,
    required this.dropDownEntries,
    required this.cellTitle,
  }) : super(key: key);

  @override
  State<InputCombobox> createState() => _InputComboboxState();
}

class _InputComboboxState extends State<InputCombobox> {
  TextEditingController userInput = TextEditingController();

  @override
  void initState() {
    super.initState();
    userEntry[widget.cellTitle] = dropdownValue;
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
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 14),
                      ),
                    );
                  }).toList(),
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      userEntry[widget.cellTitle] = dropdownValue;
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
