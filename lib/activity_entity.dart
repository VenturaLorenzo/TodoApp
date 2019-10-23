import 'package:flutter/material.dart';
import 'package:todo_app/activity.dart';

class ActivityEntity extends StatelessWidget {
  final Activity _activity;
  ActivityEntity(this._activity);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text(
          "id:" + _activity.getID().toString() + " name: " + _activity.name),
    color: Colors.orange[600],padding: EdgeInsets.all(10.0),margin: EdgeInsets.all(10.0),);
  }
}