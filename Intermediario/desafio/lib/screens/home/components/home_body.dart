import 'package:challenge_ui_plant_app/models/plant.dart';
import 'package:challenge_ui_plant_app/repositories/favorites_plant_repository.dart';
import 'package:challenge_ui_plant_app/repositories/plant_repository.dart';
import 'package:challenge_ui_plant_app/screens/plants/plant_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'header_with_searchbox.dart';
import 'recomemded_plan_list.dart';
import 'title_with_button_row.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
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
                  context,
                  "Favorite Plants",
                  context.read<FavoritesPlantRepository>().favoritesPlants)),
          RecomemdedPlantList(
            plants: context.watch<FavoritesPlantRepository>().favoritesPlants,
          ),
          TitleWithButtonRow(
              title: "All Plants",
              buttonText: "More",
              onPressed: () => navigateToPlantListScreen(context, "All Plants",
                  context.read<PlantRepository>().allPlants)),
          RecomemdedPlantList(
            plants: context.watch<PlantRepository>().allPlants,
          ),
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
