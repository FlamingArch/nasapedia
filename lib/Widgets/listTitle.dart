import 'package:flutter/material.dart';

class ThemeListTitle extends StatelessWidget {
  final String title;
  const ThemeListTitle(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12))),
      child: Text(title.toUpperCase(),
          style: Theme.of(context).textTheme.subtitle2),
    );
  }
}
