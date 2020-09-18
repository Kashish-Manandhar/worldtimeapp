import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:worldtimeapp/pages/ChooseLoaction.dart';
import 'package:worldtimeapp/pages/Home.dart';
import 'package:worldtimeapp/pages/Loading.dart';

void main() {

  runApp(
      MaterialApp(
        initialRoute: '/',
        routes:{
          '/': (context) => Loading() ,
          '/home':(context) => Home(),
          '/choose':(context) => ChooseLocation()

        }
        ));
}
