import 'package:flutter/material.dart';

import 'activity_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TODO app',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("TODO app"),
            centerTitle: true,
            elevation: 10,actions: <Widget>[Icon(Icons.ac_unit)],
          ),
          body: 
           ActivityManager(),
          
        ));
  }
}
