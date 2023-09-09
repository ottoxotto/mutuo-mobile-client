library my_prj.globals;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:mutuo_mobile_app/templates/body_it_select_graph_layout.dart';

Map userEntry = {};
Map dataTable = {};
// String finalResponse = "";
// String baseurl = "https://mutuo-mobile-server.vercel.app"; // PRODUCTION
String baseurl =
    "https://mutuo-mobile-server-git-develop-ottoxotto.vercel.app"; // DEV

List<GlobalKey<FormState>> formKeysITrata = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>()
];
String dropdownValue = "Prima Casa da Privato";
List<GlobalKey<FormState>> formKeysITspese = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>()
];
List<GlobalKey<FormState>> formKeysDErata = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>()
];
// String dropdownValue = "Prima Casa da Privato";
List<GlobalKey<FormState>> formKeysDEspese = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  // GlobalKey<FormState>()
];
// List<FlSpot>? plotData = [];
// DataLabel dataLabel = [] as DataLabel;
List<FlSpot>? globplotData = [];
DataLabel globdataLabel = DataLabel([], []);

List<double> maxMinPlot = [0, 100, 0, 100];
