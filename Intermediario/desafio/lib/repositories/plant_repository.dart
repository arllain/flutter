import 'dart:collection';
import 'dart:convert' as convert;
import 'package:challenge_ui_plant_app/models/plant.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PlantRepository extends ChangeNotifier {
  late List<Plant> _plants = [];

  PlantRepository() {
    _setUpPlantList();
  }

  UnmodifiableListView<Plant> get allPlants => UnmodifiableListView(_plants);

  addToPlants(Plant plant) {
    if (!_plants.contains(plant)) {
      _plants.add(plant);
    }
    notifyListeners();
  }

  remove(Plant plant) {
    _plants.remove(plant);
    notifyListeners();
  }

  void _setUpPlantList() async {
    String uri = 'https://study-web-app.herokuapp.com/plants';
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      List<dynamic> body = convert.jsonDecode(response.body);
      _plants = body.map((dynamic item) => Plant.fromJson(item)).toList();
      notifyListeners();
    }
  }
}
