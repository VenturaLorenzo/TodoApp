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
    return Container(color: Theme.of(context).primaryColor, child: Stack( children: <Widget>[
      ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: _activities
                  .map((activity) => ActivityEntity(activity))
                  .toList(),
            ),
          ]),
      Align(
        alignment: Alignment.bottomRight,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          RaisedButton(child:  Text("goto NEW"),onPressed: () async {
          await  Navigator.push(context,MaterialPageRoute(builder: (context) => ActivityCreationPage()));
            fetchActivities();
          },),
          RaisedButton(
            child: Text("add new"),
            onPressed: () {
              dbHelper.insertActivity(Activity("prova"));
              fetchActivities();
              setState(() {
                
              });
            },
          ),
          RaisedButton(
            child: Text("delete"),
            onPressed: () {
              _delete();
            },
          )
        ],
      ))
    ]));
  }

  // Button onPressed methods

  void _insert(Activity activity) async {
    // row to insert
    Map<String, dynamic> row = {DatabaseHelper.columnName: activity.name};
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

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

  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    fetchActivities();
    print('deleted $rowsDeleted row(s): row $id');
  }

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
