
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Networkhelper{
  Networkhelper(this.url);

  final String url;

  Future getdata() async{
    http.Response response=await http.get(Uri.parse(url));

    if(response.statusCode==200){
        print(response.statusCode);
        String data=response.body;

        var decodeddata=jsonDecode(data);
        return decodeddata;



    }
    else
    {
        print('Error');
    }
  }
}