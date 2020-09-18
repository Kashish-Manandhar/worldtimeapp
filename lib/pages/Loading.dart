import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:worldtimeapp/DataModel.dart';



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

   String curr_time;
  Future<void> setUpTime() async {
    DataModel dataModel=DataModel(location: "Kathmandu",flag: "nepal.png",url:"Asia/Kathmandu" );
    await dataModel.getData();
    setState(() {
      curr_time=dataModel.time;
      Navigator.pushReplacementNamed(context, "/home",arguments:{
        'location':dataModel.location,
        'flag':dataModel.flag,
        'time':curr_time,
        'isDayTime':dataModel.isDayTIme
      });
    });

  }


  @override
 void initState(){
    super.initState();
    setUpTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child:
                SpinKitPumpingHeart(
                  size: 100.0,
                  color:Colors.blue,

                )
        ),
      ),
    );
  }
}
