import 'package:flutter/material.dart';
import 'package:todo_app/activity.dart';

class ActivityEntity extends StatelessWidget {
  final Activity _activity;
  ActivityEntity(this._activity);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 3.0, color:Theme.of(context).primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Theme.of(context).accentColor,
          boxShadow: [
            BoxShadow(
                spreadRadius: 5.0,
                blurRadius: 25.0,
                color: Colors.black,
                offset: Offset(5.0, 5.0))
          ]),
      child: Text(
        "id:" + _activity.getID().toString() + " name: " + _activity.name,
        style: Theme.of(context).textTheme.body1,
      ),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
    );
  }
}
