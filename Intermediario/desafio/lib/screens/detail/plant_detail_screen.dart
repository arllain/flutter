import 'package:challenge_ui_plant_app/models/plant.dart';
import 'package:challenge_ui_plant_app/screens/detail/components/plant_detail_body.dart';
import 'package:flutter/material.dart';

class PlantDetailScreen extends StatelessWidget {
  const PlantDetailScreen({Key? key, required this.plant}) : super(key: key);

  final Plant plant;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlantDetailBody(
        plant: plant,
      ),
    );
  }
}
