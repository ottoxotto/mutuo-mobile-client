// import 'package:fl_chart/src/chart/base/axis_chart/axis_chart_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/charts/linechartdata_layout.dart';
// import 'package:mutuo_mobile_app/globals.dart';
// import 'package:mutuo_mobile_app/pages/linechart_page.dart';
import 'package:mutuo_mobile_app/styles.dart';

import '../templates/body_it_select_graph_layout.dart';

class LineChartWidget extends StatelessWidget {
  final DataLabel dataLabel;
  final List<FlSpot>? plotData;
  const LineChartWidget({Key? key, required this.dataLabel, this.plotData})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: Styles.defaultBorderRadius,
        ),
        color: Styles.secondaryColor,
        margin: EdgeInsets.all(Styles.defaultMarginVer),
        child: Padding(
          padding: EdgeInsets.all(Styles.defaultPaddingVer),
          child: LineChartLayout(
            plotData: plotData,
            dataLabel: dataLabel,
          ),
        ),
      );
}
