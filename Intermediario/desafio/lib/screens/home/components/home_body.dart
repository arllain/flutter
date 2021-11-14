import 'package:challenge_ui_plant_app/models/plant.dart';
import 'package:challenge_ui_plant_app/repositories/plant_repository.dart';
import 'package:challenge_ui_plant_app/screens/plants/plant_list_screen.dart';
import 'package:flutter/material.dart';
import 'header_with_searchbox.dart';
import 'recomemded_plan_list.dart';
import 'title_with_button_row.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBox(screenSize: screenSize),
          TitleWithButtonRow(
              title: "Favorite Plants",
              buttonText: "More",
              onPressed: () => navigateToPlantListScreen(
                  context, "Favorite Plants", PlantRepository.favoritesPlants)),
          const RecomemdedPlantList(),
          TitleWithButtonRow(
              title: "All Plants",
              buttonText: "More",
              onPressed: () => navigateToPlantListScreen(
                  context, "All Plants", PlantRepository.allPlants)),
          const RecomemdedPlantList(),
        ],
      ),
    );
  }

  void navigateToPlantListScreen(
      BuildContext context, String title, List<Plant> plants) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlantListScreen(
            title: title,
            plantList: plants,
          ),
        ));
  }
}
