import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/activity_creator.dart';
import 'package:todo_app/activity_model.dart';
import 'themes.dart';
import 'activity_manager.dart';
import 'style.dart';

void main() => runApp(
   MultiProvider(providers: [ChangeNotifierProvider<ActivityModel>.value(notifier: ActivityModel(),)],child:
  MaterialApp(
        title: 'TODO app',
        theme: ThemeGenerator.buildNormalTheme(),
        home: MyApp())
  ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ActivityManager();}

}
