import 'package:challenge_ui_plant_app/constants.dart';
import 'package:challenge_ui_plant_app/src/blocs/plants_bloc.dart';
import 'package:challenge_ui_plant_app/src/models/plant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllPlants();
    return Scaffold(
      appBar: buildAppBar(),
      //body: const HomeBody(),
      body: StreamBuilder(
        stream: bloc.allPlants,
        builder: (context, AsyncSnapshot<List<Plant>> snapshot) {
          if (snapshot.hasData) {
            return HomeBody(
              plantList: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"), onPressed: () {}),
    );
  }
}
