import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class DataModel{
  String location;
  String time;
  String url;
  String flag;
  bool isDayTIme;

  DataModel({this.location,this.flag,this.url});


  Future<void> getData() async {
    try{
      Response response = await http.get("http://worldtimeapi.org/api/timezone/$url");
      Map map = convert.jsonDecode(response.body);
      String datetime=map["datetime"];
      String utc=map["utc_offset"];
      // print(datetime);
      // print(utc);
      DateTime now=DateTime.parse(datetime);
      now=now.add(Duration(hours: int.parse(utc.substring(1,3)),minutes: int.parse(utc.substring(4,6))));
      isDayTIme =  now.hour >=4 && now.hour <= 18 ? true : false;
      // now=now.add(Duration(hours:))
      time=DateFormat.jm().format(now);

    }
    catch (e)
    {
        time=e.toString();
    }

  }






}