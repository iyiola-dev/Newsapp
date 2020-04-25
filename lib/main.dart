import 'package:vaw/views/home.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TrackNews",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white 
      ),
      home: Home(),
    );
  }
}