import 'package:flutter/material.dart';
import 'style.dart';
class ThemeGenerator{

static const Ocra= Color(0xFFE40AFA);
static const Arancione= Colors.orange;
static const ArancioneScuro= Color(0xFFE65100); 
static const Viola=Color(0xFF8E24AA);

static ThemeData buildNormalTheme(){


  return ThemeData(brightness: Brightness.light,primaryColor: Arancione,accentColor:ArancioneScuro,
          appBarTheme:
              AppBarTheme(color: ArancioneScuro, textTheme: TextTheme(title: AppBarTextStyle)),
          textTheme: TextTheme(body1: Body1TextStyle, title: TitleTextStyle),
          primarySwatch: Colors.orange,
        );

}
static ThemeData buildDarkTheme(){


  return ThemeData(brightness: Brightness.dark,primaryColor: ArancioneScuro,accentColor:Arancione,
          appBarTheme:
              AppBarTheme(textTheme: TextTheme(title: AppBarTextStyle)),
          textTheme: TextTheme(body1: Body1TextStyle, title: TitleTextStyle),
          primarySwatch: Colors.purple,
        );

}
}

