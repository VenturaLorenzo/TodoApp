import 'package:flutter/material.dart';
import 'package:todo_app/activity_creator.dart';
import 'package:todo_app/activity_entity.dart';

import 'activity.dart';
import 'database_helper.dart';

class ActivityManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ActivityManagerState();
  }
}

class _ActivityManagerState extends State<ActivityManager> {
  List<Activity> _activities = [Activity("prova")];
  final dbHelper = DatabaseHelper.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchActivities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            textTheme: Theme.of(context).appBarTheme.textTheme,
            title: Text("TODO app"),
            centerTitle: true,
            elevation: 10,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActivityCreationPage()));
                      fetchActivities();
                    },
              )
            ],
          ),
          body: Container(
        color: Theme.of(context).primaryColor,
        child: Stack(children: <Widget>[
          ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: _activities
                      .map((activity) =>
                          ActivityEntity(activity, () => fetchActivities()))
                      .toList(),
                ),
              ]),
          Align(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                 /* Container(margin: EdgeInsets.all(10),child:  FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActivityCreationPage()));
                      fetchActivities();
                    },
                  ),),*/
                   Container(margin: EdgeInsets.all(10),child:  FloatingActionButton(
                    child: Icon(Icons.delete),
                    onPressed: () {
                      dbHelper.deleteAll();
                      fetchActivities();
                      setState(() {});
                    },
                  ))
                ],
              ))
        ])),
        );
  }

  // Button onPressed methods

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }
/*
  void _update() async {
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: 1,
      DatabaseHelper.columnName: 'Mary',
      DatabaseHelper.columnAge: 32
    };
    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s)');
  }
*/
  Future<void> fetchActivities() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    _activities = [];
    setState(() {
      allRows.forEach(
          (row) => _activities.add(Activity(row['name']).setID(row['_id'])));
    });
  }
}
