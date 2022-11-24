import 'dart:io';

import 'package:flutter/material.dart';
import "package:mutuo_mobile_app/globals.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mutuo_mobile_app/styles.dart';

String customkey(key) {
  String customKey;
  if (key == "0" || key == "1") {
    customKey = "";
  } else {
    customKey = key;
  }

  return customKey;
}

double customMaxHeight(dynamic key) {
  double customHeight;
  if (key == "0") {
    customHeight = 20.0;
  } else {
    customHeight = 56.0;
  }

  return customHeight;
}

List<DataRow> readdata(tabella) {
  List<DataRow> rowList = [];
  List<DataCell> celle = [];
  DataRow singleRow;
  for (int i = 0; i < tabella[tabella.keys.first].length; i++) {
    // Loop 361 values
    celle = [];
    for (int j = 0; j < tabella.length; j++) {
      // Loop 7 headers
      celle.add(DataCell(Center(
        child: Text(
          tabella[tabella.keys.elementAt(j)].values.elementAt(i).toString(),
          textAlign: TextAlign.end,
          // style: const TextStyle(color: Colors.green),
        ),
      )));
    }
    singleRow = DataRow(cells: celle);
    rowList.add(singleRow);
  }
  return rowList;
}

class TabLayout extends StatefulWidget {
  final String apicall;

  const TabLayout({
    required this.apicall,
    Key? key,
  }) : super(key: key);

  @override
  State<TabLayout> createState() => _TabLayoutState();
}

class _TabLayoutState extends State<TabLayout> {
  static final Map<String, String> httpHeaders = {
    HttpHeaders.contentTypeHeader: "application/json",
    "Connection": "Keep-Alive",
    "Keep-Alive": "timeout=5, max=1000"
  };

  Future<Map> callApI(String apicall) async {
    // var url = "http://10.0.2.2:5000/$apicall";
    var url = "$baseurl/$apicall";
    final response = await http.post(Uri.parse(url),
        headers: httpHeaders, body: json.encode(userEntry));
    final decoded = json.decode(response.body) as Map<String, dynamic>;
    dataTable = decoded;
    return dataTable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.secondaryColor,
      body: LayoutBuilder(
        builder: ((context, constraints) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: SingleChildScrollView(
                  child: FutureBuilder<Map>(
                    future: callApI(widget.apicall),
                    builder:
                        (BuildContext context, AsyncSnapshot<Map> snapshot) {
                      List<Widget> children;
                      if (snapshot.hasData) {
                        children = <Widget>[
                          DataTable(
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(
                            //       20), // this only make bottom rounded and not top
                            //   color: const Color(0xE61B1D1C),
                            // ),

                            // headingRowColor:
                            //     MaterialStateProperty.all<Color>(Colors.blue),
                            columnSpacing: 20.0,
                            columns: dataTable.keys
                                .map(
                                  (key) => DataColumn(
                                    label: ConstrainedBox(
                                      constraints: const BoxConstraints(
                                        maxWidth: 130,
                                        // maxHeight: customMaxHeight(key),
                                      ),
                                      //  SET max width,
                                      child: Text(customkey(key),
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          maxLines: 2,
                                          // style: const TextStyle(
                                          //     fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.clip),
                                    ),
                                  ),
                                )
                                .toList(),
                            rows: readdata(dataTable),
                            headingRowHeight:
                                customMaxHeight(dataTable.keys.first),
                          ),
                        ];
                      } else if (snapshot.hasError) {
                        children = const <Widget>[
                          Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 60,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text('Error'),
                          ),
                        ];
                      } else {
                        children = const <Widget>[
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text('Awaiting result...'),
                          )
                        ];
                      }
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: children,
                        ),
                      );
                    },
                  ),
                ),
              ),
            )),
      ),
    );
  }
}


// class _TablayoutState extends State<Tablayout> {
  


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: LayoutBuilder(
//         builder: ((context, constraints) => SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(
//                   minHeight: constraints.maxHeight,
//                 ),
//                 child: SingleChildScrollView(
//                   child: DataTable(
//                       columnSpacing: 20.0,
//                       columns: data_table.keys
//                           .map(
//                             (key) => DataColumn(
//                               label: ConstrainedBox(
//                                 constraints: const BoxConstraints(
//                                     maxWidth: 150), //SET max width,
//                                 child:
//                                     Text(key, overflow: TextOverflow.ellipsis),
//                               ),
//                             ),
//                           )
//                           .toList(),
//                       rows: readdata(data_table)),
//                 ),
//               ),
//             )),
//       ),
//     );
//   }
// }