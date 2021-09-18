import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nasapedia/Widgets/mission_tile.dart';
import 'package:nasapedia/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var toggled = true;
  var missions;

  @override
  void initState() {
    // fetchMission();
    super.initState();
  }

  void fetchMission() async {
    String data =
        await DefaultAssetBundle.of(context).loadString('assets/missions.json');
    missions = jsonDecode(data);
    print("Missions: \n" + missions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        textTheme: Theme.of(context).textTheme,
        title: Text("NASAPedia"),
        actions: [
          Switch(
            value: toggled,
            onChanged: (bool value) {
              setState(() {
                toggled = value;
              });
            },
            activeColor: kColorAccent1,
          )
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: 11,
        itemBuilder: (context, index) {
          return MissionTile(
            id: index + 7,
            subtitle: "1968-10-11",
            imageName: "apollo${index + 7}",
          );
        },
      ),
    );
  }
}
