import 'package:flutter/material.dart';
import 'package:worldtimeapp/DataModel.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<DataModel> datlist=[DataModel(location: "Rome",flag: "rome.png",url:"Europe/Rome"),
    DataModel(location: "Kathmandu",flag: "nepal.png",url:"Asia/Kathmandu"),
    DataModel(location: "New York",flag: "america.png",url:"America/New_York"),
    DataModel(location: "Macau",flag: "macau.png",url:"Asia/Macau"),
    DataModel(location: "Rio Gallegos",flag: "argentina.png",url:"America/Argentina/Rio_Gallegos"),
    DataModel(location: "Berlin",flag: "germany.png",url:"Europe/Berlin"),
                           ];

  void updateTime(index) async
  {
    DataModel instance=datlist[index];
    await instance.getData();
    print(instance.flag);
     Navigator.pop(context, {
      'location':instance.location,
      'flag':instance.flag,
      'url':instance.url,
      'isDayTime':instance.isDayTIme
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[400],
      ),
      body: ListView.builder(
        itemCount:datlist.length
        ,
        itemBuilder: (context,index){

          return Card(
            child:ListTile(
              onTap: ()
              {

                  updateTime(index);



              },
               title:Text(
                 datlist[index].location
               ),
            ) ,
          );

        }

      ),

    );
  }
}

