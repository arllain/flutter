import 'package:challenge_ui_plant_app/src/models/plant.dart';
import 'package:flutter/material.dart';

import 'recommend_plan_card.dart';

class RecomemdedPlantList extends StatelessWidget {
  const RecomemdedPlantList({
    Key? key,
    required this.plants,
  }) : super(key: key);

  final List<Plant> plants;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: getRecomendedPlanCard(plants)),
    );
  }

  getRecomendedPlanCard(List<Plant> plants) {
    var cards = <RecomendedPlanCard>[];
    for (var plant in plants) {
      cards.add(RecomendedPlanCard(
        plant: plant,
      ));
    }
    return cards;
  }
}
