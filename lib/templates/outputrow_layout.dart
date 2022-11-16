import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mutuo_mobile_app/styles.dart';

class OutputRow extends StatefulWidget {
  final String cellTitle;
  final String cellValue;
  final String valueType;
  final String iconName;

  const OutputRow(
      {Key? key,
      required this.cellTitle,
      required this.iconName,
      required this.cellValue,
      required this.valueType})
      : super(key: key);

  @override
  State<OutputRow> createState() => _OutputRowState();
}

class _OutputRowState extends State<OutputRow> {
  Map userEntry = {};
  String outputString = "";

  String _formatOutput(String value) {
    if (value.isEmpty) {
      outputString = "";
    } else {
      outputString = NumberFormat.simpleCurrency(locale: "eu")
          .format(double.parse(widget.cellValue));
    }
    return outputString;
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
        color: Styles.accentColor,
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
              flex: 2,
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
              flex: 3,
              child: Text(
                _formatOutput(widget.cellValue),
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 17.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
