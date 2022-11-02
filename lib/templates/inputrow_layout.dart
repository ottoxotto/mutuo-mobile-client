import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/styles.dart';
import "package:mutuo_mobile_app/globals.dart";
import 'package:number_text_input_formatter/number_text_input_formatter.dart';

class InputRow extends StatefulWidget {
  final String cellTitle;
  final String iconName;
  final int formKeyNumb;
  final String initialText;
  final String valueType;
  final List<GlobalKey<FormState>> formKeyName;

  const InputRow({
    Key? key,
    required this.formKeyNumb,
    required this.cellTitle,
    required this.iconName,
    required this.initialText,
    required this.formKeyName,
    required this.valueType,
  }) : super(key: key);

  @override
  State<InputRow> createState() => _InputRowState();
}

class _InputRowState extends State<InputRow> {
  dynamic _formatter(valueType) {
    switch (valueType) {
      case "euro":
        CurrencyTextInputFormatter userInputformat = CurrencyTextInputFormatter(
            allowNegative: false, suffix: "€", insertDecimalPoint: false);
        return userInputformat;
      case "percentage":
        PercentageTextInputFormatter userInputformat =
            PercentageTextInputFormatter(suffix: "%", decimalDigits: 2);
        return userInputformat;
      case "years":
        NumberTextInputFormatter userInputformat = NumberTextInputFormatter(
          decimalDigits: 0,
        );
        return userInputformat;
      case "percentage-euro":
        NumberTextInputFormatter userInputformat = NumberTextInputFormatter(
          decimalDigits: 2,
        );
        return userInputformat;
      default:
        NumberTextInputFormatter userInputformat = NumberTextInputFormatter();
        return userInputformat;
    }
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
  void dispose() {
    userInput.dispose();
    super.dispose();
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
            flex: 3,
            child: Form(
              key: formKeys[widget.formKeyNumb],
              child: TextFormField(
                inputFormatters: [_formatter(widget.valueType)],
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
            ),
          )
        ],
      ),
    );
  }
}
