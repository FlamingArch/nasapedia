import 'package:flutter/material.dart';
import 'package:nasapedia/Controller/missions_controller.dart';
import 'package:provider/provider.dart';

import 'mission_tile.dart';

class MissionsListView extends StatelessWidget {
  const MissionsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MissionsController>(
      builder: (context, controller, child) => ListView.builder(
        itemCount: controller.missionsCount,
        itemBuilder: (context, index) {
          if (index != 0) {
            var mission = controller.missions[index - 1];
            return MissionTile(mission);
          } else {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12))),
              child: Text(
                "Missions".toUpperCase(),
                style: Theme.of(context).textTheme.subtitle2
              ),
            );
          }
          // return Text("Apollo ${mission.id}");
        },
      ),
    );
  }
}
