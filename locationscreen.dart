import 'package:clima/cityscreen.dart';
import 'package:clima/weathersystem.dart';
import 'package:flutter/material.dart';
import 'weathersystem.dart';
import 'networking.dart';

class locationscreen extends StatefulWidget {
  locationscreen({required this.locationdata});
  final  locationdata;

  @override
  State<locationscreen> createState() => _locationscreenState();
}

class _locationscreenState extends State<locationscreen> {
  late String region;
  late String sub_region;
  late String temp;
  late String weathericon;
  late String weathercondition;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('--------> locationscreen starts from here <---------------');
    updateui(widget.locationdata);


  }
  void updateui(dynamic locationdata){

    region=locationdata["sys"]["country"];
    sub_region=locationdata["name"];
    double tempdouble=locationdata["main"]["temp"];
    tempdouble=tempdouble-  273.15;
    int tempint=tempdouble.toInt();
    temp=tempint.toString();
    weathermodel Weathersys=weathermodel();
    weathericon=Weathersys.getweathericon(tempint);
    weathercondition=Weathersys.getweathercondition(tempint);

  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFcaf0f8),
        appBarTheme: AppBarTheme(color: Color(0xFF005f73))
        ),
      home: Scaffold(
        appBar: AppBar(
          title:Text( "Weather App",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),),
            actions: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return cityscreen();
                }));
                },
                  icon:Icon(Icons.location_city) )
            ],
          backgroundColor: Color(0xFF005f73 )
        ),
        body: SafeArea(
          child:  Container(
            margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
            height: 180,
            decoration: BoxDecoration(
              color: Color(0xff00b4d8),
              borderRadius: BorderRadius.circular(10.0)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20,40, 0, 0),
                      child: Text("$weathercondition",style: TextStyle(
                          fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                      ),),

                    ),

                    Container(
                        margin:EdgeInsets.fromLTRB(20, 30, 0, 0),
                        child: Text('$region $weathericon',style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600
                        ),)),
                    Container(
                        margin:EdgeInsets.fromLTRB(20, 5, 0, 0),
                        child: Text(sub_region,style: TextStyle(
                          fontSize: 16,
                        ),)),

                  ],
                ),
                SizedBox(width: 50,),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                    child: Text("$temp °C",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 40
                    ),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

