import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/charts/line_titles.dart';
// import 'package:mutuo_mobile_app/pages/linechart_page.dart';

import '../globals.dart';
import '../templates/body_it_select_graph_layout.dart';

// import '../globals.dart';

class LineChartLayout extends StatefulWidget {
  final DataLabel dataLabel;
  final List<FlSpot>? plotData;
  const LineChartLayout({Key? key, this.plotData, required this.dataLabel})
      : super(key: key);

  @override
  State<LineChartLayout> createState() => _LineChartLayoutState();
}

class _LineChartLayoutState extends State<LineChartLayout> {
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color.fromARGB(255, 144, 214, 196),
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      globplotData = widget.plotData;
      globdataLabel = widget.dataLabel;
      if (kDebugMode) {
        print(globplotData);
        print(globdataLabel);
      }
    });
  }

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          titlesData: LineTitles(widget.dataLabel).getTitleData(),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: widget.plotData,
              show: true,
              isCurved: true,
              color: gradientColors[0],
              barWidth: 5,
              // dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: gradientColors[1],
              ),
            ),
          ],
        ),
      );
}
