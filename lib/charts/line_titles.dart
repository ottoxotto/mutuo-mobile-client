import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../templates/body_it_select_graph_layout.dart';
// import 'package:mutuo_mobile_app/pages/linechart_page.dart';
// import 'package:mutuo_mobile_app/globals.dart';

class LineTitles {
  final DataLabel dataLabel;
  LineTitles(this.dataLabel);

  FlTitlesData getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 35,
            interval: (dataLabel.xaxislabel.length + 1) / 5,
            getTitlesWidget: (value, meta) =>
                bottomTitleWidgets(value, meta, dataLabel),

            // getTitlesWidget: bottomTitleWidgets(dataLabel),
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            // reservedSize: dataLabel.yaxislabel.length.toDouble(),
            reservedSize: 35,
            // interval: 3,
            getTitlesWidget: (value, meta) =>
                leftTitleWidgets(value, meta, dataLabel),
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      );
}

Widget bottomTitleWidgets(double value, TitleMeta meta, DataLabel dataLabel) {
  Widget text;
  if (dataLabel.xaxislabel.isEmpty || value == meta.max) {
    final remainder = value % meta.appliedInterval;
    if (remainder != 0.0 && remainder / meta.appliedInterval < 0.5) {
      text = const SizedBox.shrink();
    }
    text = const Text('');
  } else {
    text = Text(dataLabel.xaxislabel[value.toInt() - 1],
        style: const TextStyle(
          // color: Color(0xff75729e),
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        textAlign: TextAlign.left);
  }
  return SideTitleWidget(
    // axisSide: meta.axisSide,
    axisSide: AxisSide.bottom,
    space: 10,
    child: text,
  );
}

// SideTitles get bottomTitles => SideTitles(
SideTitles bottomTitles(dataLabel) => SideTitles(
      showTitles: true,
      getTitlesWidget: (value, meta) =>
          bottomTitleWidgets(value, meta, dataLabel),
    );

Widget leftTitleWidgets(double value, TitleMeta meta, DataLabel dataLabel) {
  String text;
  if (dataLabel.yaxislabel.isEmpty) {
    return Container();
  } else {
    // if (value >=
    //     double.parse(dataLabel.yaxislabel[dataLabel.yaxislabel.length - 1])) {
    //   int dummy = 1;
    //   // value = dataLabel.yaxislabel.length - 1;
    // }
    text = value.toString();
    // text = dataLabel.yaxislabel[value.toInt()];
  }

  return Text(text,
      style: const TextStyle(
        // color: Color(0xff75729e),
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      textAlign: TextAlign.left);
}

SideTitles leftTitles(dataLabel) => SideTitles(
      getTitlesWidget: (value, meta) =>
          leftTitleWidgets(value, meta, dataLabel),
      showTitles: true,
    );
