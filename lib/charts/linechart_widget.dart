import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/charts/linechartdata_layout.dart';
import 'package:mutuo_mobile_app/styles.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        color: Styles.bgColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: LineChartLayout(),
        ),
      );
}
