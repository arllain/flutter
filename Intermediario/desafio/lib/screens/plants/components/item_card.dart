import 'package:challenge_ui_plant_app/models/plant.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  final Plant plant;

  const ItemCard({
    Key? key,
    required this.plant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            // For  demo we use fixed height  and width
            // Now we dont need them
            // height: 180,
            // width: 160,
            decoration: BoxDecoration(
              // color: product.color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Hero(
              tag: plant.id,
              child: Image.asset(plant.image),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
          child: Text(
            // products is out demo list
            plant.name,
            //style: TextStyle(color: kTextLightColor),
          ),
        ),
        Text(
          "\$${plant.price}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
