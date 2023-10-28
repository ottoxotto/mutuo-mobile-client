import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/styles.dart';
import 'package:mutuo_mobile_app/globals.dart';

String btnLabel(btnName, language){
  Map<String, dynamic> labelTitles;
  if (language == "it"){
    labelTitles = labelTitlesIT;
  }
  else {
    labelTitles = labelTitlesEN;
  }
  return labelTitles[btnName];
}

List<String> listLabel(list, language){
  Map<String, dynamic> labelTitles;
  List<String> outlist = [];
  if (language == "it"){
    labelTitles = labelTitlesIT;
  }
  else {
    labelTitles = labelTitlesEN;
  }
  for (var item in list) {
    outlist.add(labelTitles[item]);
  }
  return outlist;
  

}
class InputCombobox extends StatefulWidget {
  final List<String> dropDownEntries;
  final String cellTitle;
  final String language; // Add this parameter
  const InputCombobox({
    Key? key,
    required this.dropDownEntries,
    required this.cellTitle,
    required this.language,
  }) : super(key: key);

  @override
  State<InputCombobox> createState() => _InputComboboxState();
}

class _InputComboboxState extends State<InputCombobox> {
  TextEditingController userInput = TextEditingController();
  String selectedValue = " ";

  @override
  void initState() {
    super.initState();
    userEntry[btnLabel(widget.cellTitle, widget.language)] = btnLabel(widget.dropDownEntries[0],widget.language) ;
    selectedValue = listLabel(widget.dropDownEntries,widget.language)[0];
  }
  
  @override
  void didUpdateWidget(covariant InputCombobox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.language != oldWidget.language) {
      // Language has changed, update the widget's state
      userEntry[btnLabel(widget.cellTitle, widget.language)] = btnLabel(
          widget.dropDownEntries[0], widget.language);
      selectedValue =
          listLabel(widget.dropDownEntries, widget.language)[0];
    }
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
                  items: listLabel(widget.dropDownEntries, widget.language)
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
                      userEntry[btnLabel(widget.cellTitle, widget.language)] = selectedValue;
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
