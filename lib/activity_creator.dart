import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todo_app/activity.dart';
import 'package:todo_app/database_helper.dart';

class ActivityCreationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ActivityCreationPageState();
  }
}

class _ActivityCreationPageState extends State<ActivityCreationPage> {
  final _formKey = GlobalKey<FormState>();
  Activity _activity = Activity("prova");

  final dbHelper = DatabaseHelper.instance;
  //ActivityCreationPage(this._formKey);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Activity Creation"),
        centerTitle: true,
        elevation: 10,
        actions: <Widget>[Icon(Icons.ac_unit)],
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
              onSaved: (val) => setState(() => _activity.name = val),
            ),
            RaisedButton(
              onPressed: () {
                final form = _formKey.currentState;
                if (form.validate()) {
                  //process data
                  form.save();
                  dbHelper.insertActivity(_activity);
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
