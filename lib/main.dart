import 'package:flutter/material.dart';
import 'package:nasapedia/Screens/home.dart';
import 'package:provider/provider.dart';
import 'Controller/controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Controller(),
      child: MaterialApp(
        home: HomePage(),
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
      ),
    );
  }
}
