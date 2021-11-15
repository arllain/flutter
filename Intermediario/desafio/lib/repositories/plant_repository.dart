import 'dart:collection';

import 'package:challenge_ui_plant_app/models/plant.dart';
import 'package:flutter/cupertino.dart';

class PlantRepository extends ChangeNotifier {
  final List<Plant> _plants = [
    Plant(
        id: "01",
        name: "SAMATHA",
        image: "assets/images/image_1.png",
        price: 345,
        country: "Russia"),
    Plant(
        id: "02",
        name: "ANGELICA",
        image: "assets/images/image_2.png",
        price: 445,
        country: "Russia"),
    Plant(
        id: "03",
        name: "ROSE",
        image: "assets/images/image_3.png",
        price: 545,
        country: "Russia")
  ];

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
}
