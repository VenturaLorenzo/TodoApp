import 'package:flutter/material.dart';
import 'package:todo_app/activity.dart';
import 'package:todo_app/database_helper.dart';

class ActivityEntity extends StatelessWidget {
  final Activity _activity;
  final dbHelper= DatabaseHelper.instance;
  final VoidCallback onDelete;

  ActivityEntity(this._activity,this.onDelete);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 3.0, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Theme.of(context).accentColor,
          boxShadow: [
            BoxShadow(
                spreadRadius: 5.0,
                blurRadius: 25.0,
                color: Colors.black,
                offset: Offset(5.0, 5.0))
          ]),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                _activity.getID().toString() + " name: " + _activity.name,
                style: Theme.of(context).textTheme.body1,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star)
                ],
              ),
              IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () {dbHelper.delete(_activity.getID());
                this.onDelete();
                },
              )
            ],
          ),
          SwitchListTile(
            title: Text("descrizione"),
            value: false,
            onChanged: (val) {},
          )
        ],
      ),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
    );
  }
}
