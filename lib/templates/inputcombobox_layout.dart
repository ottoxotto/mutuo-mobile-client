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
      // here put container into Expanded to fill the scaffold vertically
      alignment: Alignment.center,
      margin: EdgeInsets.all(Styles.defaultPadding / 3),
      padding: EdgeInsets.all(Styles.defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Styles.secondaryColor,
      ),
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
                      style: const TextStyle(fontSize: 16),
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
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 3.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  fillColor: Colors.grey,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
