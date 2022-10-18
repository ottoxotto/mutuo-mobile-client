import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/styles.dart';
import "package:mutuo_mobile_app/globals.dart";

class InputRow extends StatefulWidget {
  final String cellTitle;
  final String iconName;
  final int formKeyNumb;
  final String initialText;
  final List<GlobalKey<FormState>> formKeyName;

  const InputRow({
    Key? key,
    required this.formKeyNumb,
    required this.cellTitle,
    required this.iconName,
    required this.initialText,
    required this.formKeyName,
  }) : super(key: key);

  @override
  State<InputRow> createState() => _InputRowState();
}

class _InputRowState extends State<InputRow> {
  Stream<String?> initialTextUpdate() async* {
    yield widget.initialText;
  }

  TextEditingController userInput = TextEditingController();
  late List<GlobalKey<FormState>> formKeys;

  @override
  void initState() {
    super.initState();

    userInput = TextEditingController(
      text: widget.initialText,
    );
    formKeys = widget.formKeyName;
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
            child: StreamBuilder<String?>(
                stream: initialTextUpdate(),
                builder: (context, snapshot) {
                  return Form(
                    key: formKeys[widget.formKeyNumb],
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: userInput,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Obbligatorio';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        userEntry[widget.cellTitle] = value;
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
                        errorStyle: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
