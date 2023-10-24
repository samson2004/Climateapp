import 'package:flutter/material.dart';
import 'loading_screen.dart';
void main() {
  runApp(const clima());
}

class clima extends StatelessWidget {
  const clima({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFcaf0f8),
      ),
      home: loadingscreen(),
    );
  }
}
