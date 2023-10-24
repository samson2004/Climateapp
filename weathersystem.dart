import 'package:flutter/material.dart';

class weathermodel{
  String getweathericon(int condition){
    if(condition<=18){
      return "❄️";
    }
    if(condition>18 && condition<30){
      return "🌤️";
    }
    else{
      return "☀️";
    }
  }

  String getweathercondition(int condition){
    if(condition<=18){
      return "Bundle up, it's cold outside! ❄️";
    }
    if(condition>18 && condition<30){
        return "Clear skies, sunny vibes! ☀️";
    }
    else{
      return
        "Scorching heat today! 🔥";
    }
  }
}