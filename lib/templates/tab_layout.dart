import 'package:flutter/material.dart';
import "package:mutuo_mobile_app/globals.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

List<DataRow> readdata(tabella) {
  List<DataRow> rowList = [];
  List<DataCell> celle = [];
  DataRow singleRow;
  for (int i = 0; i < tabella[tabella.keys.first].length; i++) {
    // Loop 361 values
    celle = [];
    for (int j = 0; j < tabella.length; j++) {
      // Loop 7 headers
      celle.add(DataCell(Text(
          tabella[tabella.keys.elementAt(j)].values.elementAt(i).toString())));
    }
    singleRow = DataRow(cells: celle);
    rowList.add(singleRow);
  }
  return rowList;
}

class Tablayout extends StatefulWidget {
  final String apititle;

  const Tablayout({
    Key? key,
    required this.apititle,
  }) : super(key: key);

  @override
  State<Tablayout> createState() => _TablayoutState();
}

class _TablayoutState extends State<Tablayout> {
  String apititle = apicall;

  Future<Map> callApI(String apititle) async {
    var url = "http://10.0.2.2:5000/$apititle";
    final response =
        await http.post(Uri.parse(url), body: json.encode(userEntry));
    final decoded = json.decode(response.body) as Map<String, dynamic>;
    dataTable = decoded;
    return dataTable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: ((context, constraints) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: SingleChildScrollView(
                  child: FutureBuilder<Map>(
                    future: callApI(apititle),
                    builder:
                        (BuildContext context, AsyncSnapshot<Map> snapshot) {
                      List<Widget> children;
                      if (snapshot.hasData) {
                        children = <Widget>[
                          DataTable(
                            columnSpacing: 20.0,
                            columns: dataTable.keys
                                .map(
                                  (key) => DataColumn(
                                    label: ConstrainedBox(
                                      constraints: const BoxConstraints(
                                          maxWidth: 150), //SET max width,
                                      child: Text(key,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                )
                                .toList(),
                            rows: readdata(dataTable),
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