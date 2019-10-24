import 'package:flutter/material.dart';
import 'themes.dart';
import 'activity_manager.dart';
import 'style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TODO app',
        theme: ThemeGenerator.buildNormalTheme(),
        home: Scaffold(
          appBar: AppBar(
            title: Text("TODO app"),
            centerTitle: true,
            elevation: 10,
            actions: <Widget>[Icon(Icons.ac_unit)],
          ),
          body: ActivityManager(),
          //backgroundColor: Theme.of(context).primaryColor,
        ));
  }
}
