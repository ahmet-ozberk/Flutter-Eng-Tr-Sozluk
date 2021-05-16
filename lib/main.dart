import 'package:flutter/material.dart';
import 'home_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sözlük App",
      theme: ThemeData(
        primaryColor: Colors.blue.shade200
      ),
      home: AnaEkran(),
    );
  }
}


