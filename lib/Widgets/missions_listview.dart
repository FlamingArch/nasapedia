import 'package:flutter/material.dart';
import 'package:nasapedia/Controller/controller.dart';
import 'package:nasapedia/Widgets/listTitle.dart';
import 'package:provider/provider.dart';

import 'mission_tile.dart';

class MissionsListView extends StatelessWidget {
  const MissionsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
      builder: (context, controller, child) => ListView.builder(
        itemCount: controller.missionsCount,
        itemBuilder: (context, index) {
          if (index != 0) {
            var mission = controller.missions[index - 1];
            return MissionListTile(mission);
          } else {
            return ThemeListTitle("Missions");
          }
          // return Text("Apollo ${mission.id}");
        },
      ),
    );
  }
}
