import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/appbar_layout.dart';
import 'package:mutuo_mobile_app/unused/body_calc_spese_layout_old.dart';
import 'package:mutuo_mobile_app/templates/botnavbarnotch_layout.dart';

class ITCalcSpesePage extends StatefulWidget {
  const ITCalcSpesePage({Key? key}) : super(key: key);

  @override
  State<ITCalcSpesePage> createState() => _ITCalcSpesePageState();
}

class _ITCalcSpesePageState extends State<ITCalcSpesePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // backgroundColor: Styles.scaffoldBackgroundColor,
        appBar: AppBarLayout(title: "Calcola Spese in Italia"),
        body: ITBodyCalcSpeseLayout(),
        bottomNavigationBar: BotNavBarNotchLayout());
  }
}
