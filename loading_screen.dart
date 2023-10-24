import 'package:flutter/material.dart';
import 'location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'locationscreen.dart';
import 'networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



//open weather key=f2835421d945609297c1447f1892ed46 https://api.openweathermap.org/data/2.5/weather?lat=51.52&lon=-0.11&appid=f2835421d945609297c1447f1892ed46

const  apikey='f2835421d945609297c1447f1892ed46';

class loadingscreen extends StatefulWidget {

  @override
  State<loadingscreen> createState() => _loadingscreenState();
}

class _loadingscreenState extends State<loadingscreen> {
  late double latitude1=0.0;
  late double longitude1=0.0;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initstate void works");

    getlocationdata();
    print('coordinates have been obtained');


  }
  void getlocationdata() async{
    Location location=Location();
    await location.getcurrentlocation();
    latitude1 =location.lat;
    longitude1  =location.long;
    print("lat and long has been obtained = $latitude1 $longitude1");
    Networkhelper networkhelper=Networkhelper("https://api.openweathermap.org/data/2.5/weather?lat=$latitude1&lon=$longitude1&appid=$apikey");
    print('got location');
    var weatherdata=await networkhelper.getdata();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return locationscreen(locationdata:weatherdata);
    }));
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPulsingGrid(
          color: Color(0xFF005f73),
          size: 100,
        ),
      ),
    );
  }
}
