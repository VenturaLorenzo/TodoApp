import 'package:flutter/material.dart';
import 'package:todo_app/activity_creator.dart';
import 'package:todo_app/activity_entity.dart';
import 'package:todo_app/bloc/activity_bloc.dart';
import 'package:todo_app/bloc/bloc_provider.dart';
import 'package:todo_app/log_page.dart';
import 'package:todo_app/log_page.dart';

import 'activity.dart';
import 'database/database_helper.dart';

class ActivityViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ActivityViewPageState();
  }
}

class _ActivityViewPageState extends State<ActivityViewPage> {
  ActivityBloc _bloc;

  @override
  void initState() {
    super.initState();
   _bloc= BlocProvider.of<ActivityBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children:<Widget>[ Expanded(
                      child: StreamBuilder<List<Activity>>(
            stream: _bloc.activities,
            builder:
                (BuildContext context, AsyncSnapshot<List<Activity>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.length == 0) {
                  return Text("no data");
                }
              List<Activity> acts = snapshot.data;
              return ListView.builder(
                  itemCount: acts.length,
                  itemBuilder: (BuildContext context, int i) {
                    Activity a = acts[i];

                    return Text(a.name);
                  },
                );
              }
              return Text("bad");
              
            }),
          )
       , RaisedButton(onPressed: (){_bloc.inAddNote.add(Activity("prova"));},child: Icon(Icons.add),)
       ]);
  }
}
