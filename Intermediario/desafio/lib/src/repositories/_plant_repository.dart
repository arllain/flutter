import 'dart:collection';
import 'dart:convert' as convert;
import 'package:challenge_ui_plant_app/src/models/plant.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http_retry/http_retry.dart';

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

  Future<void> _setUpPlantList() async {
    String uri = 'https://study-web-app.herokuapp.com/plants';
    final client = RetryClient(http.Client());
    try {
      final response = await client.read(Uri.parse(uri));
      List<dynamic> body = convert.jsonDecode(response);
      _plants = body.map((dynamic item) => Plant.fromJson(item)).toList();
      notifyListeners();
    } finally {
      client.close();
    }
  }
}
