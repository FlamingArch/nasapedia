import 'package:flutter/material.dart';
import 'package:nasapedia/Controller/missions_controller.dart';
import 'package:nasapedia/Widgets/missions_listview.dart';
import 'package:nasapedia/constants.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        textTheme: Theme.of(context).textTheme,
        elevation: 0,
        title: Text("Nasapedia"),
      ),
      body: MissionsListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MissionsController.openNASAWebsite();
        },
        child: Icon(Icons.link),
        backgroundColor: kColorAccent1,
      ),
    );
  }
}
