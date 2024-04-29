import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Map<String, String>> tableData = [
    {
      'Time': '1:30 PM',
      'Date': 'January 3, 2023',
      'Email': 'chu@gmail.com',
      'User': 'RTK Achinthha',
      'Supplier': 'KND Food ',
    },
    {
      'Time': '2:30 PM',
      'Date': 'January 4, 2023',
      'Email': 'chu@gmail.com',
      'User': 'RTK Achinthha',
      'Supplier': 'KND Food',
    },
    {
      'Time': '3:30 PM',
      'Date': 'January 5, 2023',
      'Email': 'chu@gmail.com',
      'User': 'RTK Achinthha',
      'Supplier': " s&d food",
    },
    {
      'Time': '6:30 PM',
      'Date': 'june 3, 2023',
      'Email': 'chu@gmail.com',
      'User': 'RTK Achinthha',
      'Supplier': 'KND Food ',
    },
    {
      'Time': '1:30 PM',
      'Date': 'January 3, 2024',
      'Email': 'chu@gmail.com',
      'User': 'RTK Achinthha',
      'Supplier': 'KND Food ',
    },
    {
      'Time': '1:30 PM',
      'Date': 'January 3, 2023',
      'Email': 'chu@gmail.com',
      'User': 'RTK Achinthha',
      'Supplier': 'KND Food ',
    },
    {
      'Time': '1:30 PM',
      'Date': 'January 3, 2023',
      'Email': 'chu@gmail.com',
      'User': 'RTK Achinthha',
      'Supplier': ' s&d food',
    },
    {
      'Time': '1:30 PM',
      'Date': 'January 3, 2021',
      'Email': 'chu@gmail.com',
      'User': 'RTK Achinthha',
      'Supplier': ' s&d food',
    },
    {
      'Time': '1:30 PM',
      'Date': 'January 3, 2023',
      'Email': 'chu@gmail.com',
      'User': 'RTK Achinthha',
      'Supplier': ' s&d food',
    },
    {
      'Time': '1:30 PM',
      'Date': 'January 3, 2023',
      'Email': 'chu@gmail.com',
      'User': 'RTK Achinthha',
      'Supplier': 'KND Food ',
    },
    {
      'Time': '1:30 PM',
      'Date': 'January 3, 2023',
      'Email': 'chu@gmail.com',
      'User': 'RTK Achinthha',
      'Supplier': ' s&d food',
    },
    {
      'Time': '1:30 PM',
      'Date': 'January 3, 2023',
      'Email': 'chu@gmail.com',
      'User': 'RTK Achinthha',
      'Supplier': ' s&d food',
    },
    
    // Add more entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
      ),
    );
  }
}