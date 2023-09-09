import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/appbar_layout.dart';

import 'package:mutuo_mobile_app/templates/body_de_calc_rata_select_layout.dart';

class DECalcRataSelectPage extends StatefulWidget {
  const DECalcRataSelectPage({Key? key}) : super(key: key);

  @override
  State<DECalcRataSelectPage> createState() => _DECalcRataSelectPageState();
}

class _DECalcRataSelectPageState extends State<DECalcRataSelectPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Styles.scaffoldBackgroundColor,
      appBar: AppBarLayout(title: "Calcola Rata"),
      body: DEBodyCalcRataSelectLayout(),
      // bottomNavigationBar: BotNavBarLayout()
    );
  }
}
