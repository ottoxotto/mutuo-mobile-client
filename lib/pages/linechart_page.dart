import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/charts/linechart_widget.dart';
import 'package:mutuo_mobile_app/templates/appbar_layout.dart';
import 'package:mutuo_mobile_app/templates/botnavbar_layout.dart';

class LineChartPage extends StatefulWidget {
  const LineChartPage({Key? key}) : super(key: key);

  @override
  State<LineChartPage> createState() => _LineChartPageState();
}

class _LineChartPageState extends State<LineChartPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // backgroundColor: Styles.scaffoldBackgroundColor,
        appBar: AppBarLayout(title: "Grafici"),
        body: LineChartWidget(),
        bottomNavigationBar: BotNavBarLayout());
  }
}
