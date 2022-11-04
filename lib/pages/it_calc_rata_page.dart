import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/appbar_layout.dart';
import 'package:mutuo_mobile_app/templates/body_calc_rata_layout.dart';
import 'package:mutuo_mobile_app/templates/botnavbar_layout.dart';

class ITCalcRataPage extends StatefulWidget {
  const ITCalcRataPage({Key? key}) : super(key: key);

  @override
  State<ITCalcRataPage> createState() => _ITCalcRataPageState();
}

class _ITCalcRataPageState extends State<ITCalcRataPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // backgroundColor: Styles.scaffoldBackgroundColor,
        appBar: AppBarLayout(title: "Calcola Rata in Italia"),
        body: ITBodyCalcRataLayout(),
        bottomNavigationBar: BotNavBarLayout());
  }
}
