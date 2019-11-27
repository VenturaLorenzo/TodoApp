import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todo_app/activity.dart';

import 'database/database_helper.dart';

class ActivityPage extends StatefulWidget {

  ActivityPage(this._activity);
  final Activity _activity;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ActivityPageState();
  }
}

class _ActivityPageState extends State<ActivityPage> {
  final _formKey = GlobalKey<FormState>();
 
  final dbHelper = DatabaseHelper.db;
  //ActivityCreationPage(this._formKey);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Activity "+widget._activity.name),
        centerTitle: true,
        elevation: 10,
        actions: <Widget>[],
      ),
      body: Form(
        key: _formKey,
        // color: Theme.of(context).primaryColor,
        //padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (val) => setState(() => widget._activity.name = val),
            ),
            RaisedButton(
              onPressed: () {
                final form = _formKey.currentState;
                if (form.validate()) {
                  //process data
                  form.save();
//                  dbHelper.insertActivity(_activity);
                  Navigator.pop(context);
                }
              },
              child: Text("Submit"),
            )
          ],
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
