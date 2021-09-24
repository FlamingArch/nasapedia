import 'package:flutter/material.dart';
import 'package:nasapedia/Model/mission.dart';
import 'package:nasapedia/Screens/mission_detail.dart';

var sampleMission = MissionModel(
    id: 1,
    crew: [
      {"name": "grissom", "role": "Command Pilot"},
      {"name": "white", "role": "Senior Pilot"},
      {"name": "chaffee", "role": "Pilot"}
    ],
    description:
        "Apollo 1, initially designated AS-204, was the first crewed mission of the United States Apollo program, the project to land the first men on the Moon.\n\nPlanned as the first low Earth orbital test of the Apollo command and service module, to launch on February 21, 1967, the mission never flew; a cabin fire during a launch rehearsal test at Cape Kennedy Air Force Station Launch Complex 34 on January 27 killed all three crew members—Command Pilot Virgil I. \"Gus\" Grissom, Senior Pilot Ed White, and Pilot Roger B. Chaffee—and destroyed the command module (CM).\n\nThe name Apollo 1, chosen by the crew, was made official by NASA in their honor after the fire.");

class ThemeListTile extends StatelessWidget {
  final MissionModel mission;
  final bool clipCircle;
  ThemeListTile(this.mission, {Key? key, this.clipCircle = false});
  @override
  Widget build(BuildContext context) {
    String imageLink = "assets/images/apollo${mission.id}.png";
    String missionName = "Apollo ${mission.id}";
    String launchDate = "${mission.launchDate ?? "N/A"}";
    double imageSize = 50;
    return ListTile(
      title: Text(missionName),
      subtitle: Text(launchDate),
      leading: Container(
        decoration: clipCircle ? BoxDecoration(shape: BoxShape.circle) : null,
        clipBehavior: clipCircle ? Clip.antiAlias : Clip.none,
        width: imageSize,
        height: imageSize,
        child: Hero(tag: "Icon", child: Image.asset(imageLink)),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MissionDetailPage(mission),
        ),
      ),
    );
  }
}
