import 'dart:ui';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map map={};

  @override
  Widget build(BuildContext context) {

    map=ModalRoute.of(context).settings.arguments;




    String image = map['isDayTime'] ? "assets/day.jpg" : "assets/night.jpg";

    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
              repeat: ImageRepeat.noRepeat),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushReplacementNamed(
                        context, "/choose");
                    setState(() {
                      map = {
                        "location": result['location'],
                        "url": result['url'],
                        "flag": result['flag'],
                        "idDayTime": result['isDayTime']
                      };
                      print(result);

                    });
                  },
                  icon: Icon(
                    Icons.location_on,
                  ),
                  label: Text("Choose a location")),
              Text(
                map['location'],
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Text(
                map['time'],
                style: TextStyle(fontSize: 60.0),
              )
            ],
          ),
        ),
      )),
    );
  }
}
