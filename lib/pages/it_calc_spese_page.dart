import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/appbar_layout.dart';
import 'package:mutuo_mobile_app/templates/botnavbar_layout.dart';
import 'package:mutuo_mobile_app/templates/body_calc_spese_layout.dart';

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
        appBar: AppBarLayout(title: "Mutuo in Italia"),
        body: ITBodyCalcSpeseLayout(),
        bottomNavigationBar: BotNavBarLayout());
  }
}
