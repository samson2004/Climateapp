import 'package:clima/cityscreen.dart';
import 'package:flutter/material.dart';
import 'networking.dart';

class Citylocation{
  late double lat;
  late double lon;



  Future<dynamic> getcitylocation(cityname) async{
    Networkhelper networkhelper=Networkhelper('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apikey');
    var weatherdata=await networkhelper.getdata();
    lat=await weatherdata["coord"]["lat"];
    lon=await weatherdata["coord"]["lon"];
    print(lat);
    print(lon);
    print(weatherdata);
    return weatherdata;
  }

}