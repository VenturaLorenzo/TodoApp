import 'package:flutter/material.dart';
import 'package:todo_app/database_helper.dart';

class LogPage extends StatelessWidget {
  final List<Map<String, dynamic>> _logs;

  LogPage(this._logs);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("settings"),
      ),
      body: Container(
        child: Column(
          children: _logs.map((row) => Card(child: Text(row['date']+row['name']),)).toList(),
        ),
      ),
    );
  }
}
