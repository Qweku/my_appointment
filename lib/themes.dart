// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

List<ThemeData> getThemes() {
  return [
     ThemeData(
        primaryColor: Color(0xFF4CAF50),
        primaryColorLight: Color(0xFFFFFFFF),
        primaryColorDark: Colors.red,
        cardColor: Color(0xFF212121),
        textTheme: TextTheme(
            headline1: TextStyle(
                color: Color(0xFF616161), fontSize: 30, fontFamily: 'Quicksand'),
            headline2: TextStyle(
                color: Colors.white, fontSize: 30, fontFamily: 'Quicksand'),
            headline3: TextStyle(
                color: Color(0xFF616161), fontSize: 20, fontFamily: 'Quicksand'),
            headline4: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Quicksand'),
            bodyText1: TextStyle(
                color: Color(0xFF616161), fontSize: 15, fontFamily: 'Quicksand'),
            bodyText2: TextStyle(
                color: Colors.white, fontSize: 15, fontFamily: 'Quicksand'),
            button: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Quicksand')),
        iconTheme: IconThemeData(
          color: Colors.red)),
     ThemeData(
        primaryColor: Colors.blue,
        primaryColorLight: Color(0xFFFFFFFF),
        primaryColorDark: Colors.red,
        cardColor: Color(0xFF212121),
        textTheme: TextTheme(
            headline1: TextStyle(
                color: Color(0xFF616161), fontSize: 30, fontFamily: 'Quicksand'),
            headline2: TextStyle(
                color: Colors.white, fontSize: 30, fontFamily: 'Quicksand'),
            headline3: TextStyle(
                color: Color(0xFF616161), fontSize: 20, fontFamily: 'Quicksand'),
            headline4: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Quicksand'),
            bodyText1: TextStyle(
                color: Color(0xFF616161), fontSize: 15, fontFamily: 'Quicksand'),
            bodyText2: TextStyle(
                color: Colors.white, fontSize: 15, fontFamily: 'Quicksand'),
            button: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Quicksand')),
        iconTheme: IconThemeData(color: Color(0xFF212121))),
    ThemeData(
        primaryColor: Color(0xFF7B1FA2),
        primaryColorLight: Color(0xFFFFFFFF),
        primaryColorDark: Colors.amber,
        cardColor: Color(0xFF212121),
        textTheme: TextTheme(
            headline1: TextStyle(
                color: Color(0xFF616161), fontSize: 30, fontFamily: 'Quicksand'),
            headline2: TextStyle(
                color: Colors.white, fontSize: 30, fontFamily: 'Quicksand'),
            headline3: TextStyle(
                color: Color(0xFF616161), fontSize: 20, fontFamily: 'Quicksand'),
            headline4: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Quicksand'),
            bodyText1: TextStyle(
                color: Color(0xFF616161), fontSize: 15, fontFamily: 'Quicksand'),
            bodyText2: TextStyle(
                color: Colors.white, fontSize: 15, fontFamily: 'Quicksand'),
            button: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Quicksand')),
        iconTheme: IconThemeData(color: Color(0xFF212121))),
   
      ];
}
