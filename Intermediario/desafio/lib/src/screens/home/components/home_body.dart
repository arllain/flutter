import 'package:challenge_ui_plant_app/src/models/plant.dart';
import 'package:challenge_ui_plant_app/src/repositories/favorites_plant_repository.dart';
import 'package:challenge_ui_plant_app/src/repositories/plant_repository.dart';
import 'package:challenge_ui_plant_app/src/screens/plants/plant_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'header_with_searchbox.dart';
import 'recomemded_plan_list.dart';
import 'title_with_button_row.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key, required this.plantList}) : super(key: key);
  final List<Plant> plantList;
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late List<Plant> favoritesPlants;
  late List<Plant> allPlants;
  late PlantRepository plantRepository;
  late FavoritesPlantRepository favoritesPlantRepository;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    favoritesPlantRepository = context.watch<FavoritesPlantRepository>();
    plantRepository = context.watch<PlantRepository>();
    allPlants = plantRepository.allPlants;
    favoritesPlants = favoritesPlantRepository.favoritesPlants;

    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBox(screenSize: screenSize),
          TitleWithButtonRow(
              title: AppLocalizations.of(context)!.favorites,
              buttonText: AppLocalizations.of(context)!.more,
              onPressed: () => navigateToPlantListScreen(
                  context,
                  AppLocalizations.of(context)!.favorites,
                  favoritesPlantRepository.favoritesPlants)),
          RecomemdedPlantList(
            plants: favoritesPlants,
          ),
          TitleWithButtonRow(
              title: AppLocalizations.of(context)!.all_plants,
              buttonText: AppLocalizations.of(context)!.more,
              onPressed: () => navigateToPlantListScreen(
                  context,
                  AppLocalizations.of(context)!.all_plants,
                  plantRepository.allPlants)),
          RecomemdedPlantList(
            plants: allPlants,
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
