import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReserveDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('logs').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        final List<DocumentSnapshot> documents = snapshot.data!.docs;
        final List<Map<String, dynamic>> tableData = documents.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return {
            'meal': data['meal'] ?? '',
            'catogary': data['catogary'] ?? '',
            'time': data['time'] ?? '',
            'sid': data['uid'] ?? '',
            'uid': data['uid'] ?? '',
          };
        }).toList();
        return MyHomePage(tableData: tableData);
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> tableData;

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
              DataColumn(label: Text('No.')),
              DataColumn(label: Text('Log')),
              DataColumn(label: Text('Time')),
              DataColumn(label: Text('Order')),
              DataColumn(label: Text('Supplier')),
              DataColumn(label: Text('User')),
            ],
            columnSpacing: 50.0,
            rows: tableData.asMap().entries.map((entry) {
              final int index = entry.key + 1;
              final Map<String, dynamic> data = entry.value;
              return DataRow(cells: [
                DataCell(Text('$index')),
                DataCell(Text(data['time'] ?? '')),
                DataCell(Text(data['meal'] ?? '')),
                DataCell(Text(data['catogary'] ?? '')),
                DataCell(Text(data['sid'] ?? '')),
                DataCell(Text(data['uid'] ?? '')),
              ]);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
