import 'package:flutter/material.dart';
import 'package:nasapedia/Screens/astronauts.dart';
import 'package:nasapedia/Screens/missions.dart';
import 'package:nasapedia/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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
      body: [MissionsPage(), AstronautsPage()][_selectedIndex],
    );
  }
}
