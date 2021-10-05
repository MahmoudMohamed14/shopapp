import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightMode= ThemeData(

  floatingActionButtonTheme: FloatingActionButtonThemeData(
   backgroundColor: Colors.green[200]
  ),

primaryColor: Colors.green[200],
  appBarTheme: AppBarTheme(

    backgroundColor: Colors.white,

    iconTheme:IconThemeData(color: Colors.black) ,
    elevation: 0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark
    ),


  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
      headline4:TextStyle(color: Colors.black) ),

);
ThemeData darkMode= ThemeData(
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.green[200]
  ),

  primaryColor: Colors.green[200],
  appBarTheme: AppBarTheme(

    backgroundColor: Colors.black38,

    iconTheme:IconThemeData(color: Colors.white) ,
    elevation: 0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black38,
        statusBarIconBrightness: Brightness.light
    ),


  ),
  scaffoldBackgroundColor: Colors.black38,
  textTheme: TextTheme(
      headline4:TextStyle(color: Colors.white) ),

);
