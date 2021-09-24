import 'package:flutter/material.dart';
import 'package:nasapedia/Controller/missions_controller.dart';
import 'package:nasapedia/Widgets/astronauts_listview.dart';
import 'package:nasapedia/constants.dart';

class AstronautsPage extends StatelessWidget {
  AstronautsPage({Key? key}) : super(key: key);

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
      body: AstronautsListView(),
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
