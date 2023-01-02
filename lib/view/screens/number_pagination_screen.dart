import 'dart:math';
import 'package:flutter/material.dart';

class NumberPaginationScreen extends StatefulWidget {
  const NumberPaginationScreen({Key? key}) : super(key: key);

  @override
  State<NumberPaginationScreen> createState() => _NumberPaginationScreenState();
}

class _NumberPaginationScreenState extends State<NumberPaginationScreen> {
  final DataTableSource dataTableSource = MyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Pagination'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Number Pagination',
            style: TextStyle(fontSize: 25, color: Colors.yellow),
          ),
          const SizedBox(height: 50),
          PaginatedDataTable(
            columns: const [
              DataColumn(
                  label: Text('Id',
                      style: TextStyle(fontSize: 15, color: Colors.yellow))),
              DataColumn(
                  label: Text('Title',
                      style: TextStyle(fontSize: 15, color: Colors.yellow))),
              DataColumn(
                  label: Text('Price',
                      style: TextStyle(fontSize: 15, color: Colors.yellow))),
            ],
            source: dataTableSource,
            columnSpacing: 100,
            horizontalMargin: 40,
            arrowHeadColor: Colors.yellow,
          )
        ],
      )),
    );
  }
}

class MyData extends DataTableSource {
  final List<Map<String, dynamic>> data = List.generate(
      100,
      (index) => {
            "id": index + 1,
            "title": "Item ${index + 1}",
            "price": Random().nextInt(10000)
          });

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index]["id"].toString())),
      DataCell(Text(data[index]["title"])),
      DataCell(Text(data[index]["price"].toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
