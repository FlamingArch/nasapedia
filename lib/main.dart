import 'package:flutter/material.dart';
import 'package:nasapedia/Screens/tabbedView.dart';
import 'package:provider/provider.dart';
import 'Controller/missions_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => MissionsController(),
        child: MaterialApp(home: TabbedView()));
  }
}
