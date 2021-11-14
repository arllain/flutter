import 'package:challenge_ui_plant_app/models/plant.dart';
import 'package:challenge_ui_plant_app/screens/plants/components/body_plant.dart';
import 'package:flutter/material.dart';
import 'package:challenge_ui_plant_app/constants.dart';

class PlantListScreen extends StatelessWidget {
  const PlantListScreen({
    Key? key,
    required this.title,
    required this.plantList,
  }) : super(key: key);

  final String title;
  final List<Plant> plantList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: BodyPlant(
          plants: plantList,
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(title),
      backgroundColor: kPrimaryColor,
      elevation: 1,
    );
  }
}
