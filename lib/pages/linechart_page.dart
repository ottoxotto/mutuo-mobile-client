import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/appbar_layout.dart';
import 'package:mutuo_mobile_app/templates/botnavbar_layout.dart';

// bool isNumeric(var s) {
//   if (s.runtimeType == double || s.runtimeType == int) {
//     return true;
//   }
//   return false;
// }

// DataLabel extractPlotLbl(selectedGraph) {
//   List<String> xaxisLbl = [];
//   List<String> yaxisLbl = [];

//   // int counterY = 0;
//   // int startIndex = 0;
//   for (var key in dataTable.keys) {
//     if (isNumeric(dataTable[key].values.first)) {
//       xaxisLbl.add(key);
//       String val = dataTable[key].values.first.toString();
//       yaxisLbl.add(val);
//       // for (var val in dataTable[key].values) {
//       //   yaxisLbl.add(val);
//       //   break; // only first entry saved --> possibility of mulitple lines later

//       //   // if (startIndex == 999 && val.runtimeType == double) {
//       //   //   startIndex = counterY;
//       //   // }
//       //   // counterY = counterY + 1;
//       // }
//     }
//   }

//   // xaxisLbl = xaxisLbl.sublist(startIndex);
//   // yaxisLbl = yaxisLbl.sublist(startIndex);
//   return DataLabel(xaxisLbl, yaxisLbl);
// }

// List<FlSpot>? extractPlotValues(selectedGraph) {
//   if (dataTable.isNotEmpty) {
//     List<double> yaxisData = [];
//     List<String> xaxisLabel = [];

//     int counterX = 0;
//     int counterY = 0;
//     int startIndexY = 99999999;
//     int startIndexX = 99999999;
//     for (var key in dataTable.keys) {
//       if (isNumeric(key)) {
//         xaxisLabel.add(key.toString());
//       } else {
//         xaxisLabel.add(key);
//       }
//       counterX = counterX + 1;
//       for (var val in dataTable[key].values) {
//         if (isNumeric(val)) {
//           yaxisData.add(val);
//           if (startIndexY == 99999999) {
//             startIndexY = counterY;
//             startIndexX = counterX - 1;
//           }
//         } else {
//           yaxisData.add(-1);
//         }
//         counterY = counterY + 1;
//       }
//     }
//     xaxisLabel = xaxisLabel.sublist(startIndexX);
//     List<double> xaxisData = [
//       for (double i = 1; i <= xaxisLabel.length; i++) i
//     ];
//     yaxisData = yaxisData.sublist(startIndexY);

//     if (yaxisData.length > xaxisData.length) {
//       double ratio = yaxisData.length / xaxisData.length;
//       List<double> yaxisDataTemp = [];
//       counterY = 0;

//       for (double ydata in yaxisData) {
//         if (counterY % ratio == 0) {
//           yaxisDataTemp.add(ydata);
//         }
//         counterY = counterY + 1;
//       }
//       yaxisData = yaxisDataTemp;
//     }

//     for (int i = 0; i < yaxisData.length; i++) {
//       var plotData;
//       plotData?.add(FlSpot(xaxisData[i], yaxisData[i]));
//     }
//     maxMinPlot[0] = (xaxisData.min);
//     maxMinPlot[1] = (xaxisData.max);
//     maxMinPlot[2] = (yaxisData.min);
//     maxMinPlot[3] = (yaxisData.max);
//   }

//   List<FlSpot>? plotData;
//   return plotData;
// }

// class DataValue {
//   final List<double> xaxisdata;
//   final List<double> yaxisdata;

//   DataValue(this.xaxisdata, this.yaxisdata);
// }

// class DataLabel {
//   final List<String> xaxislabel;
//   final List<String> yaxislabel;

//   DataLabel(this.xaxislabel, this.yaxislabel);
// }

//-------------------------------------------------------------------------
class LineChartPage extends StatefulWidget {
  const LineChartPage({Key? key}) : super(key: key);

  @override
  State<LineChartPage> createState() => _LineChartPageState();
}

class _LineChartPageState extends State<LineChartPage> {
  late final Map arg;
  late final String buttonname;
  late final String apicode;

  // DataLabel xyinitLabel = DataLabel(["0", "1", "2"], ["0", "1", "2"]);

  @override
  Widget build(BuildContext context) {
    arg = ModalRoute.of(context)!.settings.arguments as Map;
    buttonname = arg["buttonname"];
    apicode = arg["apicode"];
    return Scaffold(
        // backgroundColor: Styles.scaffoldBackgroundColor,
        appBar: AppBarLayout(title: buttonname),
        body: const SizedBox(),
        bottomNavigationBar: const BotNavBarLayout());
  }
}
