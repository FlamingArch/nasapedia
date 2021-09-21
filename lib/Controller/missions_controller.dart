import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nasapedia/Model/mission.dart';

class MissionsController extends ChangeNotifier {
  List<MissionModel> _missions = [];

  int get missionsCount => _missions.length;

  MissionsController() {
    setMissions();
  }

  UnmodifiableListView<MissionModel> get missions =>
      UnmodifiableListView(_missions);

  void setMissions() async {
    this._missions = await getMissions();
    notifyListeners();
  }

  static Future<dynamic> fetchJSONContents() async {
    var missionData = await rootBundle.loadString('assets/missions.json');
    return missionData;
  }

  static Future<List<MissionModel>> getMissions() async {
    var data = await fetchJSONContents();
    var decodedData = jsonDecode(data);
    List<MissionModel> missions = [];
    for (var element in decodedData) {
      print("ELEMENT: " + element.toString());
      missions.add(
        MissionModel(
          id: element['id'],
          // crew: element['crew'],
          description: element['description'],
          launchDate: element['launchDate'],
        ),
      );
    }
    return missions;
  }
}
