import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/styles.dart';
import "package:mutuo_mobile_app/globals.dart";
import 'package:number_text_input_formatter/number_text_input_formatter.dart';

class InputRow2 extends StatefulWidget {
  final String cellTitle;
  final String iconName;
  final int formKeyNumb;
  final String initialText;
  final String valueType;
  final List<GlobalKey<FormState>> formKeyName;

  const InputRow2({
    Key? key,
    required this.formKeyNumb,
    required this.cellTitle,
    required this.iconName,
    required this.initialText,
    required this.formKeyName,
    required this.valueType,
  }) : super(key: key);

  @override
  State<InputRow2> createState() => _InputRow2State();
}

class _InputRow2State extends State<InputRow2> {
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: EdgeInsets.all(Styles.defaultPaddingHor * 0.1),
                      elevation: 50,
                      primary: Styles.whiteColor,
                      onPrimary: Styles.whiteColor,
                      shadowColor: Styles.secondaryColor),
                  child: Image(
                    image:
                        AssetImage("assets/icons/png/${widget.iconName}.png"),
                    width: 50,
                    height: 50,
                    color: null,
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                  )),
            ),
            const Spacer(
              flex: 1,
            ),
            Flexible(
              flex: 4,
              child: Text(
                widget.cellTitle,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 4,
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
                      borderSide: const BorderSide(
                          color: Styles.accentColor, width: 3.0),
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
      ),
    );
  }
}
