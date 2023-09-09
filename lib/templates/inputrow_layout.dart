import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
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
  final bool disableFlag;

  // final ValueNotifier<String> aValueNotifier; // Add this line

  const InputRow({
    Key? key,
    required this.formKeyNumb,
    required this.cellTitle,
    required this.iconName,
    required this.initialText,
    required this.formKeyName,
    required this.valueType,
    required this.disableFlag,
    // required this.aValueNotifier, // Add this line
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

  // Preprocess the value based on the formatter for the input type
  String preprocessValue(String value, String valueType) {
    if (value.isNotEmpty) {
      switch (valueType) {
        case "euro":
          value = NumberFormat.simpleCurrency(locale: "eu")
              .format(double.parse(value));
          return value;
        case "percentage":
          value = NumberFormat.decimalPercentPattern(decimalDigits: 2)
              .format(double.parse(value));
          return value;
        // Add more cases for other value types as needed
        default:
          return value; // No preprocessing needed for other value types
      }
    } else {
      return value;
    }
  }

  TextEditingController userInput = TextEditingController();
  late List<GlobalKey<FormState>> formKeys;
  late TextInputFormatter _inputFormatter;

  @override
  void initState() {
    super.initState();
    userInput = TextEditingController(
      text: preprocessValue(widget.initialText, widget.valueType),
    );
    formKeys = widget.formKeyName;
    // Initialize the formatter
    _inputFormatter = _formatter(widget.valueType); // Update the formatter
    if (kDebugMode) {
      print("InitState InputRow: text = $userInput");
      print("InitState InputRow _inputFormatter: $_inputFormatter");
    }
    userEntry[widget.cellTitle] = userInput.text;
  }

  @override
  void dispose() {
    userInput.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(InputRow oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if the initialText prop has changed
    if (widget.initialText != oldWidget.initialText) {
      // Preprocess the value based on the formatter before setting it
      String preprocessedValue =
          preprocessValue(widget.initialText, widget.valueType);
      userInput.text = preprocessedValue;
    }
    // Update the formatter when the valueType changes
    if (widget.valueType != oldWidget.valueType) {
      setState(() {
        _inputFormatter = _formatter(widget.valueType);
      });
    }
    if (kDebugMode) {
      print("didUpdateWidget InputRow: text = $userInput");
      print("didUpdateWidget InputRow _inputFormatter: $_inputFormatter");
    }
    userEntry[widget.cellTitle] = userInput.text;
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("Build InputRow: text = $userInput");
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
                      backgroundColor: Styles.whiteColor,
                      foregroundColor: Styles.whiteColor,
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
                  readOnly: widget.disableFlag,
                  // inputFormatters: [_formatter(widget.valueType)],
                  inputFormatters: [
                    _inputFormatter
                  ], // Use the stored formatter
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
