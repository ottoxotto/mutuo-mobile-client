import 'package:flutter/material.dart';
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
class ButtonGeneric extends StatelessWidget {
  final String buttonname;
  final String buttonlink;
  final String buttonlogo;
  final String language; // Add this parameter


  const ButtonGeneric(
      {Key? key,
      required this.buttonname,
      required this.buttonlink,
      required this.buttonlogo, 
      required this.language})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String label = btnLabel(buttonname); // Pass the language to the label function
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
        onPressed: () {
          userEntry = {};
          Navigator.pushNamed(context, "/$buttonlink");
        },
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
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: ElevatedButton(
                  onPressed: () {
                    userEntry = {};
                    Navigator.pushNamed(context, "/$buttonlink");
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: EdgeInsets.all(Styles.defaultPaddingHor * 0.1),
                      elevation: 50,
                      backgroundColor: Styles.whiteColor,
                      foregroundColor: Styles.whiteColor,
                      shadowColor: Styles.secondaryColor),
                  child: Image(
                    image: AssetImage("assets/icons/png/$buttonlogo.png"),
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
                btnLabel(buttonname, language),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
