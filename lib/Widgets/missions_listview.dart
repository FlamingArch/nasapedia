import 'package:flutter/material.dart';
import 'package:nasapedia/Controller/missions_controller.dart';
import 'package:provider/provider.dart';

import 'mission_tile.dart';

class MissionsListView extends StatelessWidget {
  const MissionsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MissionsController>(
      builder: (context, controller, child) => ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: controller.missionsCount,
        itemBuilder: (context, index) {
          var mission = controller.missions[index];
          return MissionTile(mission);
          // return Text("Apollo ${mission.id}");
        },
      ),
    );
  }
}
