import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/styles.dart';
import "package:mutuo_mobile_app/globals.dart";

class InputRow extends StatefulWidget {
  final String cellTitle;
  final String iconName;

  const InputRow({
    Key? key,
    required this.cellTitle,
    required this.iconName,
  }) : super(key: key);

  @override
  State<InputRow> createState() => _InputRowState();
}

class _InputRowState extends State<InputRow> {
  TextEditingController userInput = TextEditingController();
  String text = "";

  final _formkeys = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      // here put container into Expanded to fill the scaffold vertically
      alignment: Alignment.center,
      margin: EdgeInsets.all(Styles.defaultPadding / 2),
      padding: EdgeInsets.all(Styles.defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Styles.secondaryColor,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ImageIcon(
              AssetImage("assets/icons/png/${widget.iconName}.png"),
              color: Colors.white,
              size: 28,
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              widget.cellTitle,
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            flex: 2,
            child: Form(
              key: _formkeys,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: userInput,
                onChanged: (value) {
                  userEntry[widget.cellTitle] = value;
                  if (kDebugMode) {
                    print("onChange---------------");
                  }
                  if (kDebugMode) {
                    print(userEntry);
                  }
                },
                decoration: InputDecoration(
                  focusColor: Colors.red,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 3.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  fillColor: Colors.grey,
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: "Roboto-Medium",
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
