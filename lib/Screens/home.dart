import 'package:flutter/material.dart';
import 'package:nasapedia/Widgets/mission_tile.dart';
import 'package:nasapedia/Widgets/missions_listview.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        textTheme: Theme.of(context).textTheme,
        title: Text("NASAPedia"),
      ),
      body: MissionsListView(),
    );
  }
}
