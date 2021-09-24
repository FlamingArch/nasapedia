import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nasapedia/Model/astronaut.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:nasapedia/Model/mission.dart';

class Controller extends ChangeNotifier {
  List<MissionModel> _missions = [];
  List<AstronautModel> _astronauts = [];

  int get missionsCount => _missions.length;
  int get astronautsCount => _astronauts.length;

  Controller() {
    setMissions();
    setAstronauts();
  }

  UnmodifiableListView<MissionModel> get missions =>
      UnmodifiableListView(_missions);

  UnmodifiableListView<AstronautModel> get astronauts =>
      UnmodifiableListView(_astronauts);

  void setMissions() async {
    this._missions = await getMissions();
    notifyListeners();
  }

  void setAstronauts() async {
    this._astronauts = await getAstronauts();
    notifyListeners();
  }

  static Future<dynamic> fetchJSONContents(assetName) async {
    var data = await rootBundle.loadString('assets/$assetName.json');
    return data;
  }

  static Future<List<MissionModel>> getMissions() async {
    var data = await fetchJSONContents('missions');
    var decodedData = jsonDecode(data);
    List<MissionModel> missions = [];
    for (var element in decodedData) {
      print("ELEMENT: " + element.toString());
      missions.add(
        MissionModel(
          id: element['id'],
          crew: (element['crew']),
          description: element['description'],
          launchDate: element['launchDate'],
        ),
      );
    }
    return missions;
  }

  static Future<List<AstronautModel>> getAstronauts() async {
    var data = await fetchJSONContents('astronauts');
    var decodedData = jsonDecode(data);
    List<AstronautModel> astronauts = [];
    for (var element in decodedData) {
      print("ELEMENT: " + element.toString());
      astronauts.add(
        AstronautModel(
          id: element['id'],
          name: element['name'],
          description: element['description'],
        ),
      );
    }
    return astronauts;
  }

  static void openNASAWebsite() async {
    const url = "https://www.nasa.gov/";
    if (await canLaunch(url))
      await launch(url);
    else
      // can't launch url, there is some error
      throw "Could not launch $url";
  }

  AstronautModel getAstronaut(id) {
    return _astronauts.firstWhere((element) => element.id == id);
  }
}
