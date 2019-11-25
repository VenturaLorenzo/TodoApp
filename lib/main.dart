import 'package:flutter/material.dart';

import 'package:todo_app/activity_view_page.dart';
import 'package:todo_app/bloc/activity_bloc.dart';
import 'package:todo_app/bloc/bloc_provider.dart';
import 'themes.dart';
import 'style.dart';

void main() => runApp(MaterialApp(
    title: 'TODO app',
    // theme: ThemeGenerator.buildNormalTheme(),
    home: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Activities 1.0"),
      ),
      body: BlocProvider(
        bloc: ActivityBloc(),
        child: ActivityViewPage(),
      ),
    );
  }
}
