import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location{

  late double lat;
  late double long;

  Future<void> getcurrentlocation() async{
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      lat=position.latitude;
      long=position.longitude;


    }
    catch(e){
      print(e);
    }
  }
}