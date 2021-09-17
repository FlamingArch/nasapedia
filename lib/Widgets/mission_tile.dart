import 'package:flutter/material.dart';

class MissionTile extends StatelessWidget {
  final title, subtitle, imageName;
  const MissionTile({
    Key? key,
    @required this.title,
    @required this.subtitle,
    @required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("$title"),
      subtitle: Text("$subtitle"),
      leading: Image.asset("assets/images/$imageName.png"),
    );
  }
}
