import 'dart:collection';
import 'package:challenge_ui_plant_app/src/models/plant.dart';
import 'package:challenge_ui_plant_app/src/repositories/plant_api_provider.dart';
import 'package:flutter/cupertino.dart';

class PlantRepository extends ChangeNotifier {
  final plantsApiProvider = PlantApiProvider();
  late final List<Plant> _plants = [];

  // PlantRepository() {
  // _setUpPlantList();
  //fetchAllPlants();
  // }

  // Future<void> fetchAllPlants() async {
  //   _plants = await plantsApiProvider.fetchPlantList();
  //   notifyListeners();
  // }

  Future<List<Plant>> fetchAllPlants() => plantsApiProvider.fetchPlantList();

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

  // Future<void> _setUpPlantList() async {
  //   String uri = 'https://study-web-app.herokuapp.com/plants';
  //   final client = RetryClient(http.Client());
  //   try {
  //     final response = await client.read(Uri.parse(uri));
  //     List<dynamic> body = convert.jsonDecode(response);
  //     _plants = body.map((dynamic item) => Plant.fromJson(item)).toList();
  //     notifyListeners();
  //   } finally {
  //     client.close();
  //   }
  // }
}
