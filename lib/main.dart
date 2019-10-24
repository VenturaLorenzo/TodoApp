import 'package:flutter/material.dart';
import 'package:todo_app/settings_page.dart';
import 'themes.dart';
import 'activity_manager.dart';
import 'style.dart';

void main() => runApp(MaterialApp(
        title: 'TODO app',
        theme: ThemeGenerator.buildDarkTheme(),
        home: MyApp())
  );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("TODO app"),
            centerTitle: true,
            elevation: 10,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SettingsPage()));},
              )
            ],
          ),
          body: ActivityManager(),
        );}

}
