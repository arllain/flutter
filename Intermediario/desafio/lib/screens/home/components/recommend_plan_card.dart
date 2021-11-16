import 'package:challenge_ui_plant_app/constants.dart';
import 'package:challenge_ui_plant_app/models/plant.dart';
import 'package:challenge_ui_plant_app/repositories/favorites_plant_repository.dart';
import 'package:challenge_ui_plant_app/repositories/plant_repository.dart';
import 'package:challenge_ui_plant_app/screens/detail/plant_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/src/provider.dart';

class RecomendedPlanCard extends StatefulWidget {
  final Plant plant;
  final Function? onPressed;

  const RecomendedPlanCard({
    Key? key,
    required this.plant,
    this.onPressed,
  }) : super(key: key);

  @override
  State<RecomendedPlanCard> createState() => _RecomendedPlanCardState();
}

class _RecomendedPlanCardState extends State<RecomendedPlanCard> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlantDetailScreen(plant: widget.plant)))
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding * 2.5,
        ),
        width: screenSize.width * 0.4,
        child: Column(
          children: [
            Container(
                constraints: const BoxConstraints.expand(
                  height: 200.0,
                ),
                padding:
                    const EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.plant.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: 0.0,
                        right: 0.0,
                        child: IconButton(
                            onPressed: () {
                              if (containsInFavoriteList(context)) {
                                addToPlantList(context);
                                removeFromFavoriteList(context);
                              } else {
                                removeFromPlantList(context);
                                addToFavoriteList(context);
                              }
                            },
                            icon: getIcon())),
                  ],
                )),
            Container(
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 50,
                        color: kPrimaryColor.withOpacity(0.23))
                  ]),
              child: Row(
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: widget.plant.name + "\n".toUpperCase(),
                        style: Theme.of(context).textTheme.button),
                    TextSpan(
                        text: widget.plant.country.toUpperCase(),
                        style: TextStyle(color: kPrimaryColor.withOpacity(0.5)))
                  ])),
                  const Spacer(),
                  Text(
                    "\$" + widget.plant.price.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: kPrimaryColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bool containsInFavoriteList(BuildContext context) {
    return context
        .read<FavoritesPlantRepository>()
        .favoritesPlants
        .contains(widget.plant);
  }

  SvgPicture getIcon() {
    if (context
        .read<FavoritesPlantRepository>()
        .favoritesPlants
        .contains(widget.plant)) {
      return SvgPicture.asset("assets/icons/heart.svg");
    } else {
      return SvgPicture.asset("assets/icons/heart-outline.svg");
    }
  }

  void addToFavoriteList(BuildContext context) {
    context.read<FavoritesPlantRepository>().addToFavorite(widget.plant);
  }

  void removeFromFavoriteList(BuildContext context) {
    context.read<FavoritesPlantRepository>().remove(widget.plant);
  }

  void addToPlantList(BuildContext context) {
    context.read<PlantRepository>().addToPlants(widget.plant);
  }

  void removeFromPlantList(BuildContext context) {
    context.read<PlantRepository>().remove(widget.plant);
  }
}
