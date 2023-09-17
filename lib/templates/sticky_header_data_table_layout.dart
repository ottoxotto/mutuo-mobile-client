import 'package:flutter/material.dart';

class StickyHeaderDataTable extends StatelessWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final double headerHeight;

  const StickyHeaderDataTable({super.key, 
    required this.columns,
    required this.rows,
    this.headerHeight = 56.0, // Adjust this to match your header height
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width, // Set a fixed width or use constraints as needed
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            expandedHeight: headerHeight,
            flexibleSpace: DataTable(
              columns: columns,
              rows: const [],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 0) {
                  // Display the header only once
                  return const SizedBox.shrink(); // An empty SizedBox
                } else {
                  // Display data rows
                  return DataTable(
                    columns: columns,
                    rows: [rows[index - 1]], // Adjust the index
                  );
                }
              },
              childCount: rows.length + 1, // Add 1 for the header
            ),
          ),
        ],
      )
    );
  }
}
