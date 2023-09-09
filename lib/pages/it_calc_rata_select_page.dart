import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/appbar_layout.dart';

import '../templates/body_it_calc_rata_select_layout.dart';

class ITCalcRataSelectPage extends StatefulWidget {
  const ITCalcRataSelectPage({Key? key}) : super(key: key);

  @override
  State<ITCalcRataSelectPage> createState() => _ITCalcRataSelectPageState();
}

class _ITCalcRataSelectPageState extends State<ITCalcRataSelectPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Styles.scaffoldBackgroundColor,
      appBar: AppBarLayout(title: "Calcola Rata"),
      body: ITBodyCalcRataSelectLayout(),
      // bottomNavigationBar: BotNavBarLayout()
    );
  }
}
