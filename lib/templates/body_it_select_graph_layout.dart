// import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:mutuo_mobile_app/charts/linechart_widget.dart';
// import 'package:mutuo_mobile_app/globals.dart';
// import 'package:mutuo_mobile_app/pages/linechart_page.dart';
import 'package:mutuo_mobile_app/templates/inputcombobox_api_layout.dart';

import '../globals.dart';

bool isNumeric(var s) {
  if (s.runtimeType == double || s.runtimeType == int) {
    return true;
  }
  return false;
}

DataLabel extractPlotLbl(selectedGraph) {
  List<String> xaxisLbl = [];
  List<String> yaxisLbl = [];
  List<double> valnum = [];
  // int counterY = 0;
  // int startIndex = 0;
  for (var key in dataTable.keys) {
    if (isNumeric(dataTable[key].values.first)) {
      xaxisLbl.add(key);

      valnum.add(dataTable[key].values.first);
      // String val = dataTable[key].values.first.toString();
      // yaxisLbl.add(val);
      // for (var val in dataTable[key].values) {
      //   yaxisLbl.add(val);
      //   break; // only first entry saved --> possibility of mulitple lines later

      //   // if (startIndex == 999 && val.runtimeType == double) {
      //   //   startIndex = counterY;
      //   // }
      //   // counterY = counterY + 1;
      // }
    }
  }
  double maxY;
  double minY;
  double delta;
  double increment;
  if (valnum.isNotEmpty) {
    maxY = valnum.reduce(max);
    minY = valnum.reduce(min);
    delta = maxY - minY;
    increment = delta / (xaxisLbl.length - 1);
    for (int ii = 0; ii < xaxisLbl.length; ii++) {
      yaxisLbl.add((minY + ii * increment).toString());
    }
  } else {
    maxY = 100;
    minY = 0;
    delta = maxY - minY;
    increment = delta / 10;
  }

  // xaxisLbl = xaxisLbl.sublist(startIndex);
  // yaxisLbl = yaxisLbl.sublist(startIndex);
  return DataLabel(xaxisLbl, yaxisLbl);
}

List<FlSpot>? extractPlotValues(selectedGraph) {
  List<FlSpot>? plotData = [];
  if (dataTable.isNotEmpty) {
    List<double> yaxisData = [];
    List<String> xaxisLabel = [];

    int counterX = 0;
    int counterY = 0;
    int startIndexY = 99999999;
    int startIndexX = 99999999;
    for (var key in dataTable.keys) {
      if (isNumeric(key)) {
        xaxisLabel.add(key.toString());
      } else {
        xaxisLabel.add(key);
      }
      counterX = counterX + 1;
      for (var val in dataTable[key].values) {
        if (isNumeric(val)) {
          yaxisData.add(val);
          if (startIndexY == 99999999) {
            startIndexY = counterY;
            startIndexX = counterX - 1;
          }
        } else {
          yaxisData.add(-1);
        }
        counterY = counterY + 1;
      }
    }
    xaxisLabel = xaxisLabel.sublist(startIndexX);
    List<double> xaxisData = [
      for (double i = 1; i <= xaxisLabel.length; i++) i
    ];
    yaxisData = yaxisData.sublist(startIndexY);

    if (yaxisData.length > xaxisData.length) {
      double ratio = yaxisData.length / xaxisData.length;
      List<double> yaxisDataTemp = [];
      counterY = 0;

      for (double ydata in yaxisData) {
        if (counterY % ratio == 0) {
          yaxisDataTemp.add(ydata);
        }
        counterY = counterY + 1;
      }
      yaxisData = yaxisDataTemp;
    }

    for (int i = 0; i < yaxisData.length; i++) {
      plotData.add(FlSpot(xaxisData[i], yaxisData[i]));
    }
    // maxMinPlot[0] = (xaxisData.min);
    // maxMinPlot[1] = (xaxisData.max);
    // maxMinPlot[2] = (yaxisData.min);
    // maxMinPlot[3] = (yaxisData.max);
  }

  // List<FlSpot>? plotData;
  return plotData;
}

// class DataValue {
//   final List<double> xaxisdata;
//   final List<double> yaxisdata;

//   DataValue(this.xaxisdata, this.yaxisdata);
// }

class DataLabel {
  final List<String> xaxislabel;
  final List<String> yaxislabel;

  DataLabel(this.xaxislabel, this.yaxislabel);
}

class ITBodySelectGraphLayout extends StatefulWidget {
  const ITBodySelectGraphLayout({Key? key}) : super(key: key);

  @override
  State<ITBodySelectGraphLayout> createState() =>
      _ITBodySelectGraphLayoutState();
}

class _ITBodySelectGraphLayoutState extends State<ITBodySelectGraphLayout> {
  String _selectedGraph = "House price index"; // added
  List<FlSpot>? plotData = [];
  DataLabel dataLabel = DataLabel([], []);

  @override
  void initState() {
    super.initState();
    _fetchData(_selectedGraph); //added
  }

  void _fetchData(String selectedGraph) async {
    plotData = extractPlotValues(selectedGraph); //added
    dataLabel = extractPlotLbl(selectedGraph); //added
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        InputComboboxApi(
          cellTitle: "Grafico",
          dropDownEntries: const [
            "House price index",
            "Inflation",
            "House Ownership",
            "House Expenses",
            "Housing costs percent"
          ],
          // notifyParent: _fetchData,
          notifyParent: (value) {
            setState(() {
              _selectedGraph = value;
              _fetchData(_selectedGraph);
            });
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.70,
          child: LineChartWidget(
            plotData: plotData,
            dataLabel: dataLabel,
          ),
        ),
      ],
    );
  }
}
