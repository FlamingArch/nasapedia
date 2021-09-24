import 'package:flutter/material.dart';
import 'package:nasapedia/Controller/controller.dart';
import 'package:nasapedia/Widgets/astronauts_tile.dart';
import 'package:nasapedia/Widgets/listTitle.dart';
import 'package:provider/provider.dart';

class AstronautsListView extends StatelessWidget {
  const AstronautsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
      builder: (context, controller, child) => ListView.builder(
        itemCount: controller.astronautsCount,
        itemBuilder: (context, index) {
          if (index != 0) {
            var astronaut = controller.astronauts[index - 1];
            return AstronautsListTile(astronaut);
          } else {
            return ThemeListTitle("Astronauts");
          }
          // return Text("Apollo ${mission.id}");
        },
      ),
    );
  }
}
