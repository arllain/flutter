import 'package:challenge_ui_plant_app/constants.dart';
import 'package:challenge_ui_plant_app/models/plant.dart';
import 'package:challenge_ui_plant_app/screens/detail/components/plant_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              height: size.height * 0.5,
              width: size.width * 0.70,
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
                  image: NetworkImage(plant.image),
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        const Spacer(),
        PlantInfo(plant: plant),
        const Spacer(),
        Row(
          children: [
            SizedBox(
              width: size.width / 2,
              height: 70,
              child: ElevatedButton(
                child: Text(AppLocalizations.of(context)!.buy_now),
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
