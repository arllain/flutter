import 'dart:collection';
import 'package:challenge_ui_plant_app/src/models/plant.dart';
import 'package:flutter/cupertino.dart';

class FavoritesPlantRepository extends ChangeNotifier {
  final List<Plant> _favoritesPlants = [];

  UnmodifiableListView<Plant> get favoritesPlants =>
      UnmodifiableListView(_favoritesPlants);

  addToFavorite(Plant plant) {
    if (!_favoritesPlants.contains(plant)) {
      _favoritesPlants.add(plant);
    }
    notifyListeners();
  }

  remove(Plant plant) {
    _favoritesPlants.remove(plant);
    notifyListeners();
  }
}
