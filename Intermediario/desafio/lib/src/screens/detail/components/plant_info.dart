import 'package:challenge_ui_plant_app/constants.dart';
import 'package:challenge_ui_plant_app/src/models/plant.dart';
import 'package:flutter/material.dart';

class PlantInfo extends StatelessWidget {
  const PlantInfo({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: plant.name + "\n",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: plant.country,
                      style: const TextStyle(
                        fontSize: 16,
                        color: kPrimaryColor,
                        // fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: "    " + plant.carelevel,
                      style: const TextStyle(
                        fontSize: 16,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                "\$" + plant.price,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: kPrimaryColor),
              ),
            ],
          ),
          Text(plant.description,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 16,
                color: kPrimaryColor,
              )),
        ],
      ),
    );
  }
}
