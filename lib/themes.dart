import 'package:flutter/material.dart';
import 'style.dart';
class ThemeGenerator{


static ThemeData buildNormalTheme(){
  //const ocra= Color(1428730);
  return ThemeData(brightness: Brightness.light,primaryColor: Color(0xFFE40AFA),accentColor: Colors.purple[600],
          appBarTheme:
              AppBarTheme(textTheme: TextTheme(title: AppBarTextStyle)),
          textTheme: TextTheme(body1: Body1TextStyle, title: TitleTextStyle),
          primarySwatch: Colors.orange,
        );

}

}

