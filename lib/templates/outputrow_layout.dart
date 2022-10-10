import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/styles.dart';

class OutputRow extends StatefulWidget {
  final String cellTitle;
  final String cellValue;
  // final IconData iconName;
  final String iconName;

  const OutputRow(
      {Key? key,
      required this.cellTitle,
      required this.iconName,
      required this.cellValue})
      : super(key: key);

  @override
  State<OutputRow> createState() => _OutputRowState();
}

class _OutputRowState extends State<OutputRow> {
  Map userEntry = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      // here put container into Expanded to fill the scaffold vertically
      alignment: Alignment.center,
      margin: EdgeInsets.all(Styles.defaultPadding / 2),
      padding: EdgeInsets.all(Styles.defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3.0,
        ),
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
              style: const TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              widget.cellValue,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 15.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
