import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/globals.dart';
import 'package:mutuo_mobile_app/styles.dart';

class ButtonGeneric extends StatelessWidget {
  final String buttonname;
  final String buttonlink;

  const ButtonGeneric(
      {Key? key, required this.buttonname, required this.buttonlink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(Styles.defaultPadding / 2),
      padding: EdgeInsets.all(Styles.defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Styles.secondaryColor,
      ),
      child: ElevatedButton(
        onPressed: () {
          userEntry = {};
          Navigator.pushNamed(context, "/$buttonlink");
        },
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(15),
        ),
        child: Text(
          buttonname,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
