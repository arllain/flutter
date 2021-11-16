import 'package:challenge_ui_plant_app/constants.dart';
import 'package:challenge_ui_plant_app/models/plant.dart';
import 'package:challenge_ui_plant_app/screens/detail/components/title_price.dart';
import 'package:flutter/material.dart';

class PlantDetailBody extends StatelessWidget {
  const PlantDetailBody({Key? key, required this.plant}) : super(key: key);

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Column()),
            Container(
              height: size.height * 0.6,
              width: size.width * 0.75,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(63),
                    bottomLeft: Radius.circular(63)),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 60,
                      color: kPrimaryColor.withOpacity(0.29))
                ],
                image: DecorationImage(
                  image: AssetImage(plant.image),
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        const Spacer(),
        TitleAndPrice(
            title: plant.name, country: plant.country, price: plant.price),
        const Spacer(),
        Row(
          children: [
            SizedBox(
              width: size.width / 2,
              height: 84,
              child: ElevatedButton(
                child: const Text("Buy Now"),
                style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(20)))),
                onPressed: () {
                  final snackBar = SnackBar(
                    content: const Text(
                        'A funcionalidade de compra não foi implementada!'),
                    action: SnackBarAction(
                      label: 'Ok',
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
