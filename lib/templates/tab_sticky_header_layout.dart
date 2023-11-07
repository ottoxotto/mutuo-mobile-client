import 'dart:io';

import 'package:flutter/material.dart';
import "package:mutuo_mobile_app/globals.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mutuo_mobile_app/styles.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

List<int> countWords(String inputString) {
  int maxwordlength = 0;
  if (inputString.isEmpty) {
    return [0, 0]; // Handle the case of an empty string
  }

  // Split the input string into words
  final words = inputString.split(' ');

  // Initialize a count variable
  int wordcount = 0;

  // Iterate through the words and count those with more than 2 characters
  for (String word in words) {
    if (word.length > maxwordlength) {
      maxwordlength = word.length;
    }
      wordcount++;
  }

  return [wordcount, maxwordlength];
}

List<double> calcColumnWidth(Map<dynamic, dynamic> inputMap) {
  List<double> widths = [];
  var firstRow = extractFirstRow(inputMap);
  double width = 0;
  if (inputMap.isNotEmpty) {
    for (var value in firstRow) {
      // Calculate the width for each column based on your criteria.
      // For example, you can set a default width or calculate it dynamically.
      // double width = width; // Set a default width
      // if (value.length <=12) {
      //   width = value.length*10+5;
      // } else if (value.length <= 30) {
      //   width = value.length*3+5;
      // }
      
      if (countWords(value)[0] == 1) {
        width = countWords(value)[1]*10*1+5;
      } else if (countWords(value)[0] == 2) {
        width = value.length*10*1+5;
        // width = 80;
      } else if (countWords(value)[0] == 3) {
        width = value.length*10*1+5;
      } else if (countWords(value)[0] >= 4) {
        width = value.length*10*0.75+5;
      }

      if (firstRow.length == 2) {
        width = 200;
      }
      // You can adjust the width calculation logic here based on your needs.
      widths.add(width);
    }
  }

  return widths;
}

List<String> extractFirstRow(Map<dynamic, dynamic> inputMap) {
  List<String> firstRowValues = [];
  if (inputMap.isNotEmpty) {
    inputMap.forEach((key, value) {
        // Save keys as firstRowValues
        firstRowValues.add(key.toString());
    });
  }
  if (firstRowValues[0] == "0" && firstRowValues[1] == "1"){
    if (appLanguage == "en"){
      firstRowValues[0] = "Labels";
      firstRowValues[1] = "Values";
    }
    else {
      firstRowValues[0] = "Parametri";
      firstRowValues[1] = "Valori";
    }
  }
  return firstRowValues;
}


List<String> extractFirstColumn(Map<dynamic, dynamic> inputMap) {
  List<String> firstColumnIndices = [];
  if (inputMap.isNotEmpty) {
    final Map<dynamic, dynamic> firstRow = inputMap[inputMap.keys.first];
    for (var key in firstRow.keys) {
      firstColumnIndices.add(key.toString());
    }
  }
  return firstColumnIndices;
}







List<List<String>> mapToListOfLists(Map<dynamic, dynamic> inputMap) {
  List<List<String>> result = [];

  // Iterate through the map
  inputMap.forEach((key, value) {
    List<String> row = [];

    // Convert key to string
    // String keyString = key.toString();
    // row.add(keyString);

    value.forEach((key, value) {
      // Convert value to string
      String valueString = value.toString();
      row.add(valueString);
    });   

    result.add(row);
  });

  return result;
}


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

class TabStickyHeaderLayout extends StatefulWidget {
  final String apicall;
  final ScrollController tableController;
  
  const TabStickyHeaderLayout({
    required this.apicall,
    required this.tableController,
    Key? key,
  }) : super(key: key);

  @override
  State<TabStickyHeaderLayout> createState() => _TabStickyHeaderLayoutState();
}

class _TabStickyHeaderLayoutState extends State<TabStickyHeaderLayout> {
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
                          SizedBox(
                            height: constraints.maxHeight,
                            width: constraints.maxWidth,
                            child: StickyHeadersTable(
                              scrollControllers:ScrollControllers(verticalBodyController: widget.tableController),
                              cellDimensions: CellDimensions.variableColumnWidth(
                                columnWidths: calcColumnWidth(dataTable), 
                                contentCellHeight: 56, 
                                stickyLegendWidth: 0, 
                                stickyLegendHeight: 56
                                ),
                              cellAlignments: const CellAlignments.uniform(Alignment.center),
                              columnsLength: dataTable.length,
                              rowsLength: dataTable[dataTable.keys.first].length,
                              columnsTitleBuilder: (int index) {
                                // print("extractFirstRow0: ${extractFirstRow(dataTable)}");
                                // print("extractFirstRow1: ${extractFirstRow(dataTable)[index]}");
                                // return Text(extractFirstRow(dataTable)[index]);
                                return Column(
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.only(top: 10.0), // Add padding at the top
                                      child: Text(
                                        extractFirstRow(dataTable)[index],
                                      ),
                                    ),
                                    const Divider(
                                      height: 28,
                                      thickness: 1,
                                      color: Colors.white,
                                    )
                                  ]
                                );
                              },
                              rowsTitleBuilder: (int index) {
                                // print("extractFirstColumn0: ${extractFirstColumn(dataTable)}");
                                // print("extractFirstColumn1: ${extractFirstColumn(dataTable)[index]}");
                                // return Text(extractFirstColumn(dataTable)[index]);
                                return const Text("");
                              },
                              contentCellBuilder: (int columnIndex, int rowIndex) {
                                // print("mapToListOfLists0: ${mapToListOfLists(dataTable)}");
                                // print("mapToListOfLists1: ${mapToListOfLists(dataTable)[columnIndex][rowIndex]}");
                                return Text(mapToListOfLists(dataTable)[columnIndex][rowIndex]);
                              },
                            ),
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