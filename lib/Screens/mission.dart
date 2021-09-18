import 'package:flutter/material.dart';
import 'package:nasapedia/Model/mission.dart';
import 'package:nasapedia/constants.dart';

class MissionPage extends StatelessWidget {
  final MissionModel mission;
  const MissionPage(this.mission, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: kColorAccent1,
          pinned: true,
          floating: true,
          expandedHeight: 400,
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: const EdgeInsets.all(64.0),
              child: Image.asset('assets/images/apollo${mission.id}.png'),
            ),
            title: Text("Apollo ${mission.id}"),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return ListTile(title: Text(mission.description ?? "Error Fetching Description"));
        }, childCount: 1))
      ]),
    );
  }
}
