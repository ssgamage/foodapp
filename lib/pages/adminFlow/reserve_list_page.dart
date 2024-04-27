import 'package:flutter/material.dart';

class ReserveDetailsPage extends StatelessWidget {
  final List<Map<String, String>> tableData = [
    {
      'Time': '1:30 PM',
      'Date': 'January 3, 2023',
      'Email': 'chu@gmail.com',
      'User': 'RTK Achinthha',
      'Supplier': 'KND Food & s&d food',
    },
    // Add more entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MyHomePage(tableData: tableData);
  }
}

class MyHomePage extends StatelessWidget {
  final List<Map<String, String>> tableData;

  MyHomePage({required this.tableData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserve'),
      ),
      body: ListView(
        children: [
          DataTable(
            columns: [
              DataColumn(label: Text('Time')),
              DataColumn(label: Text('Date')),
              DataColumn(label: Text('Email')),
              DataColumn(label: Text('User')),
              DataColumn(label: Text('Supplier')),
            ],
            columnSpacing: 10.0, // Reduce the gap between columns
            rows: tableData.map((entry) {
              return DataRow(cells: [
                DataCell(Text(entry['Time'] ?? '')),
                DataCell(Text(entry['Date'] ?? '')),
                DataCell(Text(entry['Email'] ?? '')),
                DataCell(Text(entry['User'] ?? '')),
                DataCell(Text(entry['Supplier'] ?? '')),
              ]);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
