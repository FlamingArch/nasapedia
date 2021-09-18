import 'package:flutter/material.dart';
import 'package:nasapedia/Model/mission.dart';
import 'package:nasapedia/Screens/mission.dart';
import 'Screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}
