import 'dart:ffi';
import 'citylocation.dart';
import 'package:clima/loading_screen.dart';
import 'package:clima/locationscreen.dart';
import 'package:clima/networking.dart';
import 'package:flutter/material.dart';
import 'dart:async';

const  apikey='f2835421d945609297c1447f1892ed46';

class cityscreen extends StatefulWidget {



  @override
  State<cityscreen> createState() => _cityscreenState();
}

class _cityscreenState extends State<cityscreen> {

  late String cityname;
  late double latitude;
  late double longtitude;
  late String newdata;
  Citylocation citylocation=Citylocation();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Future getcityweather(cityname) async{
    try{
      Networkhelper networkhelper=Networkhelper("http://api.openweathermap.org/geo/1.0/direct?q=$cityname&limit=5&appid=$apikey");
      var newcitydata=await networkhelper.getdata();
      // var lat=await newcitydata["lat"];
      // var long=await newcitydata["lon"];
      return newcitydata;
    }
    catch(e){
      print("Error fetching city weather data: $e");
      return "Error";
    }

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFcaf0f8),
          appBarTheme: AppBarTheme(color: Color(0xFF005f73),centerTitle: true)
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return loadingscreen();
              }));
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text("Get weather",style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22
          ),),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: TextField(
                style: TextStyle(
                    color: Colors.black
                ),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    icon: Icon(Icons.location_city,),
                    hintText: "Enter your city ",
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
                onChanged: (value){
                  cityname=value;
                },
              ),
            ),
            GestureDetector(
              onTap: () async {
                if(cityname!=null){
                  print(cityname);
                  var newdata=await citylocation.getcitylocation(cityname);
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return locationscreen(locationdata: newdata);
                  }));
                }


              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                width: 200,
                height: 50,
                child: Center(child: Text("Search",style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),)),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
