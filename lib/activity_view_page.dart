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
    // TODO: implement initState
    super.initState();
  BlocProvider.of<ActivityBloc>(context);
 }

  @override
  Widget build(BuildContext context) {
  return Column();
  
  }
}
