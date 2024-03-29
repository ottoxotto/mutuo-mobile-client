import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mutuo_mobile_app/globals.dart';
import 'package:mutuo_mobile_app/styles.dart';

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
class OutputRow extends StatefulWidget {
  final String cellTitle;
  final String cellValue;
  final String valueType;
  final String iconName;
  final String language; // Add this parameter


  const OutputRow(
      {Key? key,
      required this.cellTitle,
      required this.iconName,
      required this.cellValue,
      required this.valueType, 
      required this.language})
      : super(key: key);

  @override
  State<OutputRow> createState() => _OutputRowState();
}

class _OutputRowState extends State<OutputRow> {
  Map userEntry = {};
  String outputString = "";

  String _formatOutput(String value, String valueType) {
    if (value.isEmpty) {
      outputString = "";
    } else if (valueType == "euro") {
      outputString = NumberFormat.simpleCurrency(locale: "eu")
          .format(double.parse(widget.cellValue));
    } else if (valueType == "percentage") {
      outputString =
          NumberFormat.percentPattern().format(double.parse(widget.cellValue));
    }
    return outputString;
  }

  // dynamic _formatter(valueType) {
  //   switch (valueType) {
  //     case "euro":
  //       CurrencyTextInputFormatter userInputformat = CurrencyTextInputFormatter(
  //           allowNegative: false, suffix: "€", insertDecimalPoint: false);
  //       return userInputformat;
  //     case "percentage":
  //       PercentageTextInputFormatter userInputformat =
  //           PercentageTextInputFormatter(suffix: "%", decimalDigits: 2);
  //       return userInputformat;
  //     case "years":
  //       NumberTextInputFormatter userInputformat = NumberTextInputFormatter(
  //         decimalDigits: 0,
  //       );
  //       return userInputformat;
  //     case "percentage-euro":
  //       NumberTextInputFormatter userInputformat = NumberTextInputFormatter(
  //         decimalDigits: 2,
  //       );
  //       return userInputformat;
  //     default:
  //       NumberTextInputFormatter userInputformat = NumberTextInputFormatter();
  //       return userInputformat;
  //   }
  // }

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
              flex: 3,
              child: Text(
                btnLabel(widget.cellTitle, widget.language),
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
              child: Text(
                _formatOutput(widget.cellValue, widget.valueType),
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
