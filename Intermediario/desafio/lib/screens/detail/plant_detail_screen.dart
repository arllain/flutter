import 'package:challenge_ui_plant_app/models/plant.dart';
import 'package:challenge_ui_plant_app/screens/detail/components/plant_detail_body.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class PlantDetailScreen extends StatelessWidget {
  const PlantDetailScreen({Key? key, required this.plant}) : super(key: key);

  final Plant plant;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: PlantDetailBody(
        plant: plant,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      //title: const Text("Plant Detail"),
      backgroundColor: kPrimaryColor,
      elevation: 1,
    );
  }
}
