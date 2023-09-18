import 'package:advanced_icon/advanced_icon.dart';
import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/styles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import "package:mutuo_mobile_app/globals.dart";

Future callApI(apiName) async {
  // var url = "http://10.0.2.2:5000/$apiName";
  var url = "$baseurl/$apiName";
  final response =
      await http.post(Uri.parse(url), body: json.encode(userEntry));
  final decoded = json.decode(response.body) as Map<String, dynamic>;
  dataTable = decoded;
}

class BotNavBarNotchAnimatedLayout extends StatefulWidget {
  final bool flagBlink;
  const BotNavBarNotchAnimatedLayout({Key? key, required this.flagBlink})
      : super(key: key);

  @override
  State<BotNavBarNotchAnimatedLayout> createState() =>
      _BotNavBarNotchAnimatedLayoutState();
}

class _BotNavBarNotchAnimatedLayoutState
    extends State<BotNavBarNotchAnimatedLayout> {
  int _selectedIndex = 0;
  // bool _isAnimating = false;
  // bool _isTapped = false;
  AdvancedIconState _state = AdvancedIconState.primary;
  double _iconopacity = 0.3;

  @override
  void initState() {
    super.initState();
    if (widget.flagBlink) {
      setState(() {
        _state = AdvancedIconState.secondary;
        _iconopacity = 1;
      });
    } else {
      setState(() {
        _state = AdvancedIconState.primary;
        _iconopacity = 0.3;
      });
    }
  }

  @override
  void didUpdateWidget(covariant BotNavBarNotchAnimatedLayout oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.flagBlink != oldWidget.flagBlink) {
      setState(() {
        _state = widget.flagBlink
            ? AdvancedIconState.secondary
            : AdvancedIconState.primary;
        _iconopacity = 1;
      });
    }
  }

  // void _changeState() {
  //   setState(() {
  //     if (_state == AdvancedIconState.primary) {
  //       _state = AdvancedIconState.secondary;
  //     } else {
  //       _state = AdvancedIconState.primary;
  //     }
  //   });
  // }

  void _onItemTapped(int index) {
    setState(() {
      // _isAnimating = false;
      _selectedIndex = index;
    });
    // if (_selectedIndex == 1) {
    //   _changeState();
    // }

    if (_selectedIndex == 0) {
      Navigator.popUntil(context, ModalRoute.withName('/home'));
    } else if (_selectedIndex == 1) {
      if (ModalRoute.of(context)?.settings.name == "/ITcalcRataAnniCalc") {
        callApI("outMutuo");
        Navigator.pushNamed(context, "/ITcalcRataTable");
      } else if (ModalRoute.of(context)?.settings.name ==
          "/ITcalcRataRataFissa") {
        callApI("outMutuo");
        Navigator.pushNamed(context, "/ITcalcRataTable");
      } else if (ModalRoute.of(context)?.settings.name ==
          "/ITcalcRataRimborsoCap") {
        callApI("outMutuo");
        Navigator.pushNamed(context, "/ITcalcRataTable");
      } else if (ModalRoute.of(context)?.settings.name == "/ITcalcSpese") {
        callApI("outSpese");
        Navigator.pushNamed(context, "/ITcalcSpeseTable");
      } else if (ModalRoute.of(context)?.settings.name == "/DEcalcSpese") {
        callApI("outSpeseDE");
        Navigator.pushNamed(context, "/DEcalcSpeseTable");
      } else if (ModalRoute.of(context)?.settings.name ==
          "/DEcalcRataAnniCalc") {
        callApI("outMutuo");
        Navigator.pushNamed(context, "/DEcalcRataTable");
      } else if (ModalRoute.of(context)?.settings.name ==
          "/DEcalcRataRataFissa") {
        callApI("outMutuo");
        Navigator.pushNamed(context, "/DEcalcRataTable");
      } else if (ModalRoute.of(context)?.settings.name ==
          "/DEcalcRataRimborsoCap") {
        callApI("outMutuoDE");
        Navigator.pushNamed(context, "/DEcalcRataTable");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // borderRadius: Styles.defaultBorderRadius,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Styles.defaultRadius * 0.1),
        topRight: Radius.circular(Styles.defaultRadius * 0.1),
      ),
      child: BottomAppBar(
        //bottom navigation bar on scaffold
        color: Styles.secondaryColor,
        // elevation: 50,
        shape: const CircularNotchedRectangle(), //shape of notch
        notchMargin:
            5, //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const ImageIcon(AssetImage("assets/icons/png/home.png"),
                  color: Styles.whiteColor, size: 26),
              onPressed: () {
                _onItemTapped(0);
              },
            ),
            // GestureDetector(
            //   onTap: () {
            //     _onItemTapped(1);
            //   },
            // child: IconButton(
            IconButton(
              icon: AdvancedIcon(
                icon: Icons
                    .keyboard_double_arrow_right_rounded, //change this icon as per your requirement.
                secondaryIcon: Icons
                    .keyboard_double_arrow_right_rounded, //change this icon as per your requirement.
                color: Styles.whiteColor, //color of primary icon, change it as per your requirement
                secondaryColor: Styles.whiteColor, //color of secondary icon, change it as per your requirement
                state: _state,
                opacity: _iconopacity,
                effect: AdvancedIconEffect
                    .bubbleFade, //change effect as per your requirement.
                duration: const Duration(milliseconds: 900),
                size: 26,
              ),
              onPressed: () {
                _onItemTapped(1);
              },
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
