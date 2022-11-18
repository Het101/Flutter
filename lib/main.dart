import 'package:flutter/material.dart';
import 'package:new_app/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp(
      title: "MediSage",
      home: HomePage(),

    );
  } 
}

