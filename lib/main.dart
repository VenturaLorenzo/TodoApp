import 'package:flutter/material.dart';
import 'package:todo_app/activity_creator.dart';
import 'themes.dart';
import 'activity_manager.dart';
import 'style.dart';

void main() => runApp(MaterialApp(
        title: 'TODO app',
        theme: ThemeGenerator.buildNormalTheme(),
        home: MyApp())
  );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ActivityManager();}

}
