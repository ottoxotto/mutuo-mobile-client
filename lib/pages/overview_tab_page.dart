import 'package:flutter/material.dart';
import "package:mutuo_mobile_app/globals.dart";
import 'package:mutuo_mobile_app/templates/appbar_layout.dart';
import 'package:mutuo_mobile_app/templates/botnavbar_layout.dart';

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

class OverviewTab extends StatefulWidget {
  const OverviewTab({Key? key}) : super(key: key);

  @override
  State<OverviewTab> createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarLayout(title: "Piano di Ammortamento"),
      body: LayoutBuilder(
        builder: ((context, constraints) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: SingleChildScrollView(
                  child: DataTable(
                      columnSpacing: 20.0,
                      columns: dataTable.keys
                          .map(
                            (key) => DataColumn(
                              label: ConstrainedBox(
                                constraints: const BoxConstraints(
                                    maxWidth: 150), //SET max width,
                                child:
                                    Text(key, overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          )
                          .toList(),
                      rows: readdata(dataTable)),
                ),
              ),
            )),
      ),
      bottomNavigationBar: const BotNavBarLayout(),
    );
  }
}
