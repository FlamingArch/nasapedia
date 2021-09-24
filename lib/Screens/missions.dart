import 'package:flutter/material.dart';
import 'package:nasapedia/Controller/controller.dart';
import 'package:nasapedia/Widgets/missions_listview.dart';
import 'package:nasapedia/constants.dart';

class MissionsPage extends StatelessWidget {
  MissionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        textTheme: Theme.of(context).textTheme,
        centerTitle: true,
        elevation: 0,
        title: Text("Nasapedia"),
      ),
      body: MissionsListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Controller.openNASAWebsite();
        },
        child: Icon(Icons.link),
        backgroundColor: kColorAccent1,
      ),
    );
  }
}
