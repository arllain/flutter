import 'package:challenge_ui_plant_app/constants.dart';
import 'package:challenge_ui_plant_app/models/plant.dart';
import 'package:challenge_ui_plant_app/screens/home/components/recommend_plan_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyPlant extends StatelessWidget {
  const BodyPlant({Key? key, required this.plants}) : super(key: key);

  final List<Plant> plants;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: GridView.builder(
                itemCount: plants.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPadding,
                  //crossAxisSpacing: kDefaultPadding,
                  childAspectRatio: 0.58,
                ),
                itemBuilder: (context, index) => RecomendedPlanCard(
                      plant: plants[index],
                    )),
          ),
        ),
      ],
    );
  }
}
