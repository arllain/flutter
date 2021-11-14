import 'package:challenge_ui_plant_app/models/plant.dart';

class PlantRepository {
  static List<Plant> allPlants = [
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

  static List<Plant> favoritesPlants = [
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
}
