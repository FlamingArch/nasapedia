import 'package:flutter/material.dart';
import 'package:nasapedia/Model/mission.dart';
import 'package:nasapedia/Screens/mission.dart';

var sampleMission = MissionModel(
    id: 1,
    crew: [
      {"name": "grissom", "role": "Command Pilot"},
      {"name": "white", "role": "Senior Pilot"},
      {"name": "chaffee", "role": "Pilot"}
    ],
    description:
        "Apollo 1, initially designated AS-204, was the first crewed mission of the United States Apollo program, the project to land the first men on the Moon.\n\nPlanned as the first low Earth orbital test of the Apollo command and service module, to launch on February 21, 1967, the mission never flew; a cabin fire during a launch rehearsal test at Cape Kennedy Air Force Station Launch Complex 34 on January 27 killed all three crew members—Command Pilot Virgil I. \"Gus\" Grissom, Senior Pilot Ed White, and Pilot Roger B. Chaffee—and destroyed the command module (CM).\n\nThe name Apollo 1, chosen by the crew, was made official by NASA in their honor after the fire.");

class MissionTile extends StatelessWidget {
  final int? id;
  final String? subtitle, imageName;
  final Function? onTap;
  const MissionTile({
    Key? key,
    @required this.id,
    @required this.subtitle,
    @required this.imageName,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Apollo $id"),
      subtitle: Text("$subtitle"),
      leading: Image.asset("assets/images/$imageName.png"),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MissionPage(MissionModel(
                crew: sampleMission.crew,
                id: id,
                description: sampleMission.description))),
      ),
    );
  }
}
