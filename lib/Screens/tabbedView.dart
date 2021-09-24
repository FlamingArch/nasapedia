import 'package:flutter/material.dart';
import 'package:nasapedia/Screens/home.dart';
import 'package:nasapedia/constants.dart';

class TabbedView extends StatefulWidget {
  const TabbedView({Key? key}) : super(key: key);

  @override
  _TabbedViewState createState() => _TabbedViewState();
}

class _TabbedViewState extends State<TabbedView> {
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kColorAccent1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.public), label: "Missions"),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: "Astronauts"),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
      body: [HomePage(), Text("Astronomical")][_selectedIndex],
    );
  }
}
